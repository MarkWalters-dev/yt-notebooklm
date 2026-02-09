{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
    pkgs.glow
    
    (pkgs.python3.withPackages (ps: [
      ps.google-generativeai
      ps.python-dotenv
    ]))
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
  '';
}
