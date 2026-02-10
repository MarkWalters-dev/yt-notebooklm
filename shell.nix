{ pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
    };
} }:

let
  rawHostname = builtins.readFile /etc/hostname;
  hostname = pkgs.lib.trim (pkgs.lib.replaceStrings ["\n" "\r"] ["" ""] rawHostname);
  isP72 = hostname == "p72";
  lib = pkgs.lib;

  # STABLE DEEPGRAM SDK
  deepgram-sdk = pkgs.python3Packages.buildPythonPackage rec {
    pname = "deepgram-sdk";
    version = "3.7.0"; 
    format = "setuptools";
    
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/source/d/deepgram-sdk/deepgram_sdk-${version}.tar.gz";
      # USE THE REAL HASH HERE:
      sha256 = "sha256-PBgX5M7IYyxOR7Ti4xI85HpRZKAVcrkPNvimdXNlHaM="; 
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
      p.deprecation
      p.aenum
      p.dataclasses_json
    ]))
  ] 
  ++ lib.optionals isP72 [ 
    pkgs.whisper-cpp
    pkgs.openblas 
  ];

  shellHook = ''
    export PATH="$PWD:$PATH"
    # Ensure SSL certs are found within the shell environment
    export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
    
    echo "🔍 Nix detected hostname: '${hostname}'"
    if [ "${hostname}" = "p72" ]; then
      echo "🚀 p72 detected: Full toolset loaded."
    else
      echo "💻 Host: ${hostname} (p72 tools skipped)"
    fi
  '';
}