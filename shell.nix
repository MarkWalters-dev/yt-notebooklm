{ pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
    };
} }:

let
  # Sanitize hostname to remove trailing newlines/whitespace
  rawHostname = builtins.readFile /etc/hostname;
  hostname = pkgs.lib.trim (pkgs.lib.replaceStrings ["\n" "\r"] ["" ""] rawHostname);
  isP72 = hostname == "p72";
  lib = pkgs.lib;

  # Define the missing SDK as a local derivation
  deepgram-sdk = pkgs.python3Packages.buildPythonPackage rec {
    pname = "deepgram-sdk";
    version = "3.7.0";
    format = "setuptools";
    src = pkgs.python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-4YI2mS2WfD3nB1vN1fJ6XmZ2p8Xl3X1b9Xl3X1b9Xl3="; # Replace with your actual hash
    };
    doCheck = false;
    propagatedBuildInputs = with pkgs.python3Packages; [ aiohttp websockets typing-extensions httpx ];
  };

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
      p.tqdm
    ] ++ lib.optionals isP72 [ 
      p.faster-whisper
      deepgram-sdk
      p.httpx
      p.backoff
    ]))
  ] 
  ++ lib.optionals isP72 [ 
    pkgs.whisper-cpp
    pkgs.openblas 
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
    
    # Debug info to verify the hostname check is working
    echo "🔍 Nix detected hostname: '${hostname}'"
    
    if [ "${hostname}" = "p72" ]; then
      echo "🚀 p72 detected: Full toolset (Whisper + Cloud APIs) loaded."
    else
      echo "💻 Host: ${hostname} (p72-specific tools skipped)"
    fi
  '';
}