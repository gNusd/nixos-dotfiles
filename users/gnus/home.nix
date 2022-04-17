{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};

in

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "gnus";
  home.homeDirectory = "/home/gnus";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.

  programs = {
    git = {
      enable = true;
      userName = "gnus";
      userEmail = "gnus@mailbox.org";
    };
    home-manager.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        yzhang.markdown-all-in-one
        ms-python.python
        davidlday.languagetool-linter
        ms-vscode-remote.remote-ssh
        jnoortheen.nix-ide
        redhat.vscode-yaml
        vspacecode.whichkey
        ];
        userSettings = {
          "terminal.integrated.fontFamily" = "Source Code Pro";
          "vscode-neovim.neovimExecutablePaths.linux" = "/nix/store/193bwdb99bz3aqsqmmsc1s5gzw40qnc3-system-path/bin/nvim";
          "keyboard.dispatch" = "keyCode";
        };
    };
  };

  home.packages = with pkgs; [

    curl
    xclip
    vifm
    fwupd
    bat
    dust
    fd
    ripgrep
    tokei
    bottom
    bandwhich
    delta
    neofetch
    htop
    starship

    # fonts
    source-code-pro
    nerdfonts

    # themes
    kde-gruvbox

    # editors
    qownnotes

    # lsp
    python39Packages.python-lsp-server
    yarn-bash-completion
    vimPlugins.vim-lsp
    lua53Packages.lua-lsp
    nodePackages.dockerfile-language-server-nodejs
    rnix-lsp

    # gui
    vivaldi
    nextcloud-client
    bitwarden
    virt-manager
    mullvad-vpn
    tdesktop
    neochat
    gimp
    mpv
    transmission-qt
    zathura
    veracrypt

    # kde plasma apps
    libsForQt5.ksshaskpass
    libsForQt5.qtkeychain
    libsForQt5.bismuth
    libsForQt5.korganizer
    libsForQt5.libkdepim
    libsForQt5.pimcommon
    libsForQt5.pim-sieve-editor
    libsForQt5.pim-data-exporter
    libsForQt5.yakuake
    libsForQt5.kdeconnect-kde
    libsForQt5.kmail

    # libaries
    vivaldi-widevine
    vivaldi-ffmpeg-codecs
  ];

  home.file = {
    # ".zshrc".source = ./dotfiles/.zshrc;
    # ".tmux.conf".source = ./dotfiles/.tmux.conf;
    ".config/nushell/config.nu".source = ./dotfiles/.config/nu/config.nu;
    ".config/nvim/init.vim".source = ./dotfiles/.config/nvim/init.vim;
    ".config/vifm".source = ./dotfiles/.config/vifm;
    ".config/zathura".source = ./dotfiles/.config/zathura;
    ".config/tridactyl".source = ./dotfiles/.config/tridactyl;
  };

  xdg.userDirs = {
    enable = false;
    createDirectories = true;

    # The XDG base directories. Most of my setup with this user will be my
    # personal computer so I'll set them like so...
    desktop = "$HOME/desktop";
    download = "$HOME/downloads";
    documents = "$HOME/nextcloud/dokument";
    pictures = "$HOME/nextcloud/moln/bilder";
    videos = "$HOME/nextcloud/moln/video";
  };
}
