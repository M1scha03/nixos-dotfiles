{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Github CLI
    gh
    # Rust packages
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    # C packages
    gcc
    # Nix packages
    nil
    nixfmt
    # Lua packages
    stylua
    lua-language-server
    # Javascript/Typescript packages
    nodejs
    typescript
    tsx
    typescript-language-server
    # other
    opencode
    zed-editor
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
