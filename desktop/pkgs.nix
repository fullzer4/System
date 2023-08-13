{pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     hyprland
     kitty
     wofi
     eww
     pavucontrol
     dunst
     libnotify
     

     firefox
     chromium
     obsidian
     discord

     vim
     wget

     git
     python312
     nodejs_20
     deno
     rustc
     rustup
     rustfmt
     gnat13
     gccgo13
     clang-tools
     gnumake
     cmake
     ninja
     gdb
     clang-tools
     cppcheck

     docker
     docker-compose
     podman
     podman-compose
  ];
}
