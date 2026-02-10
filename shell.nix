{ pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
    };
} }:

let
  rawHostname = builtins.readFile /etc/hostname;
  hostname = pkgs.lib.removeSuffix "\n" rawHostname;
  isP72 = hostname == "p72";
  lib = pkgs.lib;

in
pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
    pkgs.glow
    pkgs.bc
    pkgs.tmux
    
    (pkgs.python3.withPackages (p: [
      p.google-genai
      p.python-dotenv
      p.tqdm # Add this for progress bars
    ] ++ lib.optionals isP72 [ 
      p.faster-whisper 
    ]))
  ] 
  ++ lib.optionals isP72 [ 
    pkgs.whisper-cpp
    pkgs.openblas 
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
    
    if [ "${hostname}" = "p72" ]; then
      echo "🚀 p72 detected: Faster-Whisper and Whisper.cpp are both loaded."
    elif [ -z "${hostname}" ]; then
      echo "⚠️ Hostname not detected. Run: export HOSTNAME=\$HOSTNAME; nix-shell"
    else
      echo "💻 Host: ${hostname} (Whisper tools skipped)"
    fi
  '';
}