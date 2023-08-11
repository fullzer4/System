{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in

{
  imports = [
    ./hardware-configuration.nix
    (import "${home-manager}/nixos")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fullzer4"; 
  #networking.wireless.enable = true; 

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
    layout = "br";
    xkbVariant = "nodeadkeys";
  };

  console.keyMap = "br-abnt2";

  users.users.fullzer4 = {
    isNormalUser = true;
    description = "fullzer4";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     hyprland
     kitty
     wofi
     eww
     
     firefox
     obsidian
     discord

     vim
     wget

     git
  ];

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

  home-manager.users.fullzer4 = { config, pkgs, ... } : {
    home.stateVersion = "23.05";
    home.packages = [
      pkgs.hyprland
    ];

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
