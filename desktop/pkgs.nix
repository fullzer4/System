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
     neofetch

     firefox
     chromium
     obsidian
     discord
     
     zsh
     oh-my-zsh
     spaceship-prompt
     vim
     neovim
     vscode
     wget

     git
     python310
     python310Packages.pip
     python310Packages.virtualenv
     nodejs_18
     yarn
     nodePackages_latest.typescript
     nodePackages_latest.prisma
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
