{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.yt-dlp
    pkgs.ffmpeg
  ];

  # Optional: Define aliases or environment variables here
  shellHook = ''
    echo "Environment loaded with yt-dlp and ffmpeg."
  '';
}
