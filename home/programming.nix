{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    gcc
    nil
    nixfmt
    stylua
    lua-language-server
    opencode
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;

    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.lua
        p.nix
        p.rust
      ]))
    ];
  };
}
