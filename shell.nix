{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
    
    # Python 3 with Gemini and DotEnv libraries
    (pkgs.python3.withPackages (ps: [
      ps.google-generativeai
      ps.python-dotenv
    ]))
  ];

  shellHook = ''
    echo "Environment loaded with yt-dlp, ffmpeg, and Python dependencies."
    export PATH=".:$PATH"
  '';
}
