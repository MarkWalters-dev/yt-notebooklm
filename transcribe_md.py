#!/usr/bin/env python
import os
import logging
from pathlib import Path
from dotenv import load_dotenv
from google import genai

load_dotenv()

API_KEY = os.getenv("GEMINI_API_KEY")
if not API_KEY:
    raise ValueError("Error: GEMINI_API_KEY not found in .env file.")

BASE_SUBS_DIR = "subs"
BASE_MD_DIR = "md"

logging.basicConfig(
    filename="transcribe_md.log",
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s"
)

client = genai.Client(api_key=API_KEY)
MODEL_NAME = "gemini-2.5-flash"

def convert_to_markdown(transcript, channel_name, file_stem):
    import re
    video_id_pattern = re.compile(r'^[A-Za-z0-9_-]{11}$')
    tokens = file_stem.split()
    if tokens and video_id_pattern.match(tokens[-1]):
        title_text = ' '.join(tokens[:-1])
    else:
        base_name_no_underscore = file_stem.replace('_', '')
        if video_id_pattern.match(base_name_no_underscore[-11:]):
            title_text = file_stem[:-12].rstrip()
        else:
            title_text = file_stem
    title = f"# {title_text}\n\n"
    prompt = [
        transcript,
        {
            f"Format this transcript into a clean, structured Markdown study note. Use the title: '# {title_text}'.\n\n",
            "**Strict Editing Rules for AI Optimization:**\n",
            "1. **Executive Summary:** Start with a bulleted 'Executive Summary' of the 3-5 key scientific findings.\n",
            "2. **Remove Visual References:** Delete phrases like 'black circles', 'as shown in the right panel', or 'you can see here'. Describe the data trend directly instead (e.g., 'The data shows a 50% increase').\n",
            "3. **Format Protocols as Lists:** If the speaker describes a step-by-step protocol (like exercise routines or study methodology), format it as a clear bulleted list.\n",
            "4. **Standardize Terms:** Replace 'lit mice' with 'Little (dwarf) mice' throughout. Ensure chemical names are spelled correctly.\n",
            "5. **Delete Meta-Commentary:** Remove intros, outros, Patreon plugs, or calls to leave comments. Keep only the scientific data.\n",
            "6. **Structure:** Use H2 headings (##) for major scientific topics (e.g., 'Mouse Data', 'Human Evidence')."
        }
    ]
    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )
    transcript_md = response.text.strip()
    if transcript_md.startswith(title.strip()):
        transcript_md = transcript_md[len(title.strip()):].lstrip('\n')
    markdown = title + transcript_md + '\n'
    return markdown

def main():
    for channel_dir in Path(BASE_SUBS_DIR).iterdir():
        if channel_dir.is_dir():
            channel_name = channel_dir.name
            md_channel_dir = Path(BASE_MD_DIR) / channel_name
            md_channel_dir.mkdir(parents=True, exist_ok=True)
            for transcript_file in channel_dir.glob("*.txt"):
                md_file = md_channel_dir / transcript_file.name.replace(".txt", ".md")
                if md_file.exists():
                    print(f"Skipping {md_file} (Markdown already exists)")
                    continue
                with open(transcript_file, "r", encoding="utf-8") as f:
                    transcript = f.read()
                markdown = convert_to_markdown(transcript, channel_name, transcript_file.stem)
                with open(md_file, "w", encoding="utf-8") as f:
                    f.write(markdown)
                print(f"Saved: {md_file}")

if __name__ == "__main__":
    main()
