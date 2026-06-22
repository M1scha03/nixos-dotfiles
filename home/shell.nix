{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    eza
    fzf
    fd
    ripgrep
    zoxide
    starship
    bat
    fastfetch
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "nixos btw";
      nixrebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "ls -a";
      lt = "eza --tree --level=2 --long --icons --git";
      lta = "lt -a";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };

    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  programs.starship.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.television = {
    enable = true;
    enableZshIntegration = true;
  };
}
