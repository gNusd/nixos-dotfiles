{ config, pkgs, ... }:

let unstable = import <nixos-unstable> {};
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
  programs.home-manager.enable = true;

  home.packages = with pkgs; [

    curl
    exa
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
    freshfetch
    htop


    # shells
    ## nushell
    unstable.nushell

    ## zsh
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-fast-syntax-highlighting

    # fonts
    source-code-pro
    # nerdfonts

    # themes
    kde-gruvbox

    # editors
    vscode

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
    signal-desktop
    neochat
    gimp
    mpv

    # libaries
    libsForQt5.bismuth
    libsForQt5.kdeconnect-kde
    libsForQt5.kmail
    vivaldi-widevine
    vivaldi-ffmpeg-codecs
  ];

  programs.git = {
    enable = true;
    userName = "gnus";
    userEmail = "gnus@mailbox.org";
  };

home.file = {
  ".zshrc".source = ./dotfiles/.zshrc;
  ".tmux.conf".source = ./dotfiles/.tmux.conf;
  ".config/nu/config.toml".source = ./dotfiles/.config/nu/config.toml;
  ".config/nvim/init.vim".source = ./dotfiles/.config/nvim/init.vim;
  ".config/vifm".source = ./dotfiles/.config/vifm;
  ".config/zathura".source = ./dotfiles/.config/zathura;
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
