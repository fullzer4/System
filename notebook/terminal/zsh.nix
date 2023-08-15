{pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "spaceship";
      custom = "\$HOME/.config/oh-my-zsh/custom";
    };
  };

  xdg = {
    enable = true;
    configFile."oh-my-zsh/custom/themes/spaceship.zsh-theme".source =
        let
          theme = pkgs.fetchFromGitHub {
            owner = "denysdovhan";
            repo = "spaceship-prompt";
            rev = "9ac9d76b35b15f19f99e6b133780cd1c6b67a4c7";
            sha256 = "0i8b2x5pnaydmck1daih243f74s1rrm8w9asakkkhbmbphw1wy93";
          };
        in "${theme}/spaceship.zsh";
  };
}
