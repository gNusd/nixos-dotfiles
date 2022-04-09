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
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
sudo nix-channel --update
```

Add unstable channel to home.nix

```
{config, pkgs, ...}:

*let unstable = import <nixos-unstable> {};*
*in*

{
  # Home Manager ......
```

In the packages section add unstable. to the package you want to install from the unstable channel.


