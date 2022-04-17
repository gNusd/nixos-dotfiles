# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let unstable = import <nixos-unstable> {};
    nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in

{
  imports =
    [
      # Configuration for the thinkpad t480
      <nixos-hardware/lenovo/thinkpad/t480>
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

##########
## BOOT ##
##########

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 15;
    };
    efi.canTouchEfiVariables = true;
  };

################
## NETWORKING ##
################

  networking = {
    hostName = "Voight-Kampff"; # Define your hostname.
    networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp0s20f0u4u2.useDHCP = true;

  # Open ports in the firewall.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22222 22 1714 1716 1764 ];
      allowedUDPPorts = [ 22222 22 1714 1716 1764 ];
      allowPing = false;
    };
  };

###################
## USER & LOCALS ##
###################

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "sv_SE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gnus = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "wheel" "libvirtd" ];
    shell = pkgs.nushell;
  };

#########
## X11 ##
#########

  # Enable the X11 windowing system with the Plasma 5 Desktop Environment and configure keymap in X11
  services = {
    xserver = {
      enable = true;
      exportConfiguration = true;
      layout = "se";
      videoDrivers = [ "nvidia" ];
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
      };
      desktopManager.plasma5 = {
        enable = true;
        #runUsingSystemd = true;
      };
      libinput.enable = true;
    };
  };

##############
## HARDWARE ##
##############

  # Enable prime nvidia
  hardware = {
    nvidia = {
      modesetting.enable = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    pulseaudio = {
      enable = true;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
    };
    bluetooth = {
      enable = true;
	  hsphfpd.enable = true;
	  powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
 };

  # Enable sound.
  sound.enable = true;

##############
## SOFTWARE ##
##############

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    unstable.nushell
    neovim
    firefox
  ];

####################
## VIRTUALISATION ##
####################

virtualisation.libvirtd.enable = true;

##############
## SERVICES ##
##############

  # Enable services
  services = {
    openssh = {
      enable = true;
      permitRootLogin = "no";
    };
    tlp.enable = true;
    auto-cpufreq.enable = true;
    printing.enable = true;
  };

##############
## SECURITY ##
##############

  security.pam.services.gnus.sshAgentAuth = true;

#############################
## UPDATES AND MAINTANANCE ##
#############################

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-21.11";
  };

  nix.autoOptimiseStore = true;

############
## FLAKES ##
############

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}
