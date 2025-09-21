{ config, pkgs, ... }:

{
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05"; 
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
  # pkgs listed below !
  neovim
  zig
  gcc
  lsd
  fastfetch
  zoxide
  fzf
  brave
  sl
  cmatrix
  pipes-rs
  ripgrep
  ranger
  vesktop
  ngrok
  bat
  btop
  ];
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
