# my installation

I use gtp partition scheme and btrfs on the main partition and luks to encrypt my main partition.

## Pre-installation

```
fdisk /dev/path
create a new partition scheme with g
create new partition with n
set it to size +500M
chenage the type to EFI with t and 1
create new partition with n
write changes to disk with w
```

encrypt main partition with luks and open it

```
cryptsetup -y -v luksFormat /dev/sda#
cryptsetup luksOpen /dev/sda# NIXROOT
```

Make file system on both partitions
```
mkfs.fat -F 32 -n boot /dev/sda#
fatlable /dev/sda# NIXBOOT

mkfs.btrfs -L NIXROOT /dev/mapper/NIXROOT
```

Mount file system and create subvolumes

```
mount /dev/mapper/NIXROOT /mnt/
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@HOME
btrfs subvolume create /mnt/.snapshots

btrfs subvolume list /mnt

umount /mnt
mount /dev/mapper/NIXROOT subvolid=# /mnt
cd /mnt
mkdir boot home .snapshots
mount /dev/mapper/NIXROOT subvolid=# /mnt/home
mount /dev/mapper/NIXROOT subvolid=# /mnt/.snapshots
mount /dev/sda# /mnt/boot
```

Generate configuration.nix and hardware-configuration.nix

```
nixos-generate-configuration --root /mnt
```
Check the configuration.nix and install system with:

```
nixos-install
reboot
```
## Thinkpad T480

Add to the configuration.nix
```

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      
      <nixos-hardware/lenovo/thinkpad/t480>
      
      ./hardware-configuration.nix
    ];
```

The WiFi card was autodetected. WiFi configuration with `nmcli`.
```
 # /etc/nixos/configuration.nix
    networking.networkmanager.enable = true; # Enable network manager
```

Power management and monitoring is done using `tlp` and `upower`.
```
  # For thinkpad
    services.tlp.enable = true;
    
  # Battery power management
    services.upower.enable = true;
```
#### discrete graphics 
[PRIME](https://discourse.nixos.org/t/cant-use-nvidia-prime-with-laptop/6767)
offload mode

**Available since 20.09** (see [#66601](https://github.com/NixOS/nixpkgs/pull/66601)).

In this mode the Nvidia card is only activated on demand, however a Nvidia card of the Turing generation or newer and an Intel Coffee Lake chipset is required for a complete poweroff of the Nvidia card (see [discussion](https://discourse.nixos.org/t/how-to-use-nvidia-prime-offload-to-run-the-x-server-on-the-integrated-board/9091/19?u=moritzschaefer)).

Offload mode is enabled by running your program(s) with specific environment variables, i.e., here's a sample script called `nvidia-offload` that you can run wrapped around your exacutable, for example `nvidia-offload glxgears`:

```
nvidia-offload
```

```
export __NV_PRIME_RENDER_OFFLOAD=1
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
exec -a "$0" "$@"
```

  
To configure Offload mode, you firstly you need to enable the proprietary Nvidia driver:

```
/etc/nixos/configuration.nix
```

```
{
  services.xserver.videoDrivers = [ "nvidia" ];
  ...

```
Note that on **certain laptops** and/or if you are using a custom kernel version, you may have issues with your NixOS system finding the primary display. In this case you should use `hardware.nvidia.modesetting.enable`, i.e.:


```
/etc/nixos/configuration.nix
```

 
```
{
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  // ...
```

  
Then you need to setup the Bus ID's of the cards as seen below.

_Note: Bus ID is important and needs to be formatted properly_

The Nvidia driver expects the bus ID to be in decimal format; There are two ways you can get the bus IDs, one is with lspci, which shows the bus IDs in hexadecimal format and the other with lshw, which shows it in decimal format, as wanted by nixos.

## Post-installation

home-manager

```
 nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
 nix-channel --update
 ```
 Log out and then in again of the system so the path will come in effect

 ```
 nix-shell '<home-manager>' -A install
 ```
Adding support for installing packages from unstable channel to home-manager config. Add the channel and update it.

```
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --update
```

Add unstable channel to home.nix

```
{config, pkgs, ...}:

# ADD THESE TWO LINES TO HOME.NIX
let unstable = import <nixos-unstable> {};
in

{
  # Home Manager ......
```

In the packages section add unstable. to the package you want to install from the unstable channel.


