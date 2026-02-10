{ pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
    };
} }:

let
  rawHostname = builtins.readFile /etc/hostname;
  hostname = pkgs.lib.removeSuffix "\n" rawHostname;
  isP72 = currentHost == "p72";
  lib = pkgs.lib;

in
pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
    pkgs.glow
    pkgs.bc
    pkgs.byobu
    
    (pkgs.python3.withPackages (p: [
      p.google-genai
      p.python-dotenv
    ] ++ lib.optionals isP72 [ 
      p.faster-whisper 
    ]))
  ] 
  ++ lib.optionals isP72 [ 
    pkgs.openai-whisper-cpp
    pkgs.openblas 
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
    
    if [ "${currentHost}" = "p72" ]; then
      echo "🚀 p72 detected: Faster-Whisper and Whisper.cpp are both loaded."
    elif [ -z "${currentHost}" ]; then
      echo "⚠️ Hostname not detected. Run: export HOSTNAME=\$HOSTNAME; nix-shell"
    else
      echo "💻 Host: ${currentHost} (Whisper tools skipped)"
    fi
  '';
}