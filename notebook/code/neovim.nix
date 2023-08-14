{pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      molokai
    ];
    extraPackages = with pkgs; [
      rnix-lsp
      sumneko-lua-language-server
    ];
  };
}
