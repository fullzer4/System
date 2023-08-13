{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in

{
  imports =
    [ 
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gigibiel";
  # networking.wireless.enable = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.fullzer4 = {
    isNormalUser = true;
    description = "fullzer4";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.getty.autologinUser = "fullzer4";

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

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
  
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  home-manager.users.fullzer4 = { config, pkgs, ... } : {
    home.stateVersion = "23.05";

    #imports = [
    #  "/etc/nixos/code/git.nix"
    #];

    home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile /home/fullzer4/.ssh/id_rsa.pub}";

    programs.bash.enable = true;
    programs.zsh.enable = true;
    programs.git = {
      enable = true;
      userName = "fullzer4";
      userEmail = "gabrielpelizzaro@gmail.com";
      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        user.signingkey = "~/.ssh/id_rsa.pub";
      };
    };
    
    programs.bash.initExtra = ''
      if [ "$(tty)" = "/dev/tty1" ];then
        exec Hyprland
      fi
    '';
  };  

  system.stateVersion = "23.05";

}
