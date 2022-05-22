final: prev:

{
  userPackages = prev.userPackages or { } // prev.recurseIntoAttrs {
    inherit (prev)
      aria2 direnv docker-compose ethtool git gnupg
      htop i7z iotop ipset iptraf-ng jq moreutils
      ncdu neovim nvme-cli pv ripgrep smartmontools
      socat sshfs-fuse stress tcpdump tmux traceroute
      tree unzip yq zip zstd;

    inherit (prev)
      fd file fzf nixFlakes;

    nix-rebuild = prev.writeScriptBin "nix-rebuild" ''
      #!${prev.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${final.nix}/bin:$PATH
      fi
      exec nix-env -f '<nixpkgs>' -r -iA userPackages "$@"
    '';
  };
}
