from google import genai
import os
from dotenv import load_dotenv

load_dotenv()

# Initialize the new Client
client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))

print("Available models:")

# List models using the new iterator
for m in client.models.list():
    # The attribute is now 'supported_actions'
    # We check if it supports 'generateContent'
    if m.supported_actions and "generateContent" in m.supported_actions:
        print(f" - {m.name} ({m.display_name})")