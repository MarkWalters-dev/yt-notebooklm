{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
    pkgs.glow
    
    (pkgs.python3.withPackages (p: [
      p.google-genai
      p.python-dotenv
    ]))
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
  '';
}
