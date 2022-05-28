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
    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = false;
        scan_timeout = 10;
      };
    };
    gpg.enable = true;
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
        mads-hartmann.bash-ide-vscode
        ];
        userSettings = {
          "terminal.integrated.fontFamily" = "Source Code Pro";
          "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
          "keyboard.dispatch" = "keyCode";
          "git.path" = "${pkgs.git}/bin/git";
          "path-intellisense.autoSlashAfterDirectory" = true;
          "path-intellisense.showHiddenFiles" = true;
          "security.workspace.trust.untrustedFiles" = "open";
          "editor.fontSize" = 16;
          "editor.fontFamily" = "Source Code Pro";
          "languageTool.language" = "sv";
          "cSpell.language" = "sv,sv-SE";
          "markdown-preview-enhanced.previewTheme" = "atom-dark.css";
          "workbench.colorTheme" = "Monokai";
          "window.zoomLevel" = 0;
          "git.confirmSync" = false;
           "c-cpp-compile-run.c-compiler" = "/nix/store/nla0kzc0gvzc1fkqqg3vyb75zqn0d16p-home-manager-path/bin/gcc";
        };
    };
  zathura.options = {
    default-fg = "#CCBBCC";
    default-bg = "#000000";
  };
  };
  home.packages = with pkgs; [

    curl
    xclip
    vifm
    fwupd
    bat
    fd
    ripgrep
    tokei
    bottom
    bandwhich
    delta
    neofetch
    htop
    starship
    unzip
    nmap
	  rsync

    #development
    gcc
    gnumake

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
    qutebrowser
    vlc

    # kde plasma apps
    libsForQt5.kdeconnect-kde
    libsForQt5.ksshaskpass
    libsForQt5.qtkeychain
    libsForQt5.bismuth
    libsForQt5.korganizer
    libsForQt5.libkdepim
    libsForQt5.pimcommon
    libsForQt5.pim-sieve-editor
    libsForQt5.pim-data-exporter
    libsForQt5.yakuake
    libsForQt5.kmail

    # libaries
    vivaldi-widevine
    vivaldi-ffmpeg-codecs

	# development
    clib
    glibc
	  rustc
	  cargo
  ];

  home.file = {
    # ".zshrc".source = ./dotfiles/.zshrc;
    # ".tmux.conf".source = ./dotfiles/.tmux.conf;
    ".bashrc".source = ./dotfiles/.bashrc;
    ".ssh/config".source = ./dotfiles/.ssh/config;
    ".config/nushell/config.nu".source = ./dotfiles/.config/nu/config.nu;
    ".config/nushell/env.nu".source = ./dotfiles/.config/nu/env.nu;
    ".config/nvim/init.vim".source = ./dotfiles/.config/nvim/init.vim;
    ".config/vifm".source = ./dotfiles/.config/vifm;
    ".config/tridactyl".source = ./dotfiles/.config/tridactyl;
    ".config/qutebrowser/config.py".source = ./dotfiles/.config/qutebrowser/config.py;
    ".config/qutebrowser/gruvbox.py".source = ./dotfiles/.config/qutebrowser/gruvbox.py;
    ".config/qutebrowser/gnus.py".source = ./dotfiles/.config/qutebrowser/gnus.py;
  };

  xdg.userDirs = {
    enable = false;
    createDirectories = true;
    desktop = "$HOME/desktop";
    download = "$HOME/downloads";
    documents = "$HOME/nextcloud/dokument";
    pictures = "$HOME/nextcloud/moln/bilder";
    videos = "$HOME/nextcloud/moln/video";
  };

  systemd.user.services.bitwarden = {
    Unit = {
      Description = "Bitwarden";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
    Install = {WantedBy = ["graphical-session.target"];};
    Service = {ExecStart = "${pkgs.bitwarden}/bin/bitwarden";};
  };
}
