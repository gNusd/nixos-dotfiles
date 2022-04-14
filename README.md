# nixos-dotfiles

This repo contains both my installation scripts for nixos and my dotfiles. My dotfiles are located [here](users/gnus/dotfiles).

## my installation

I update this file when I make changes to the `configuration.nix` or anything else in the installation or rebuild process. 

### Pre-installation

I use gtp partition scheme and btrfs on the main partition and luks to encrypt it. You can also use another file system like ext4 if you want to then just ignore the subvolume part of the discription. 

```
fdisk /dev/path
create a new partition scheme with g
create new partition with n
set it to size +500M
change the type to EFI with t and 1
create new partition with n
set it to the size you want for your swap
change the type to Linux-swap with t and 17
create new partition with n
give it the rest of the disc
write changes to disk with w
```

encrypt main partition with luks and open it

```
cryptsetup -y -v luksFormat /dev/sda#
cryptsetup luksOpen /dev/sda# NIXROOT
```

Make file system and swap on the partitions you created
```
mkfs.fat -F 32 -n boot /dev/sda#
fatlable /dev/sda# NIXBOOT

mkfs.btrfs -L NIXROOT /dev/mapper/NIXROOT

mkswap /dev/sda#
swapon /dev/sda#
```

Mount file system and create subvolumes

```
mount /dev/mapper/NIXROOT /mnt/
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@HOME
btrfs subvolume create /mnt/.snapshots

btrfs subvolume list /mnt

umount /mnt
mount /dev/mapper/NIXROOT -o subvolid=# /mnt
cd /mnt
mkdir boot home .snapshots
mount /dev/mapper/NIXROOT -o subvolid=# /mnt/home
mount /dev/mapper/NIXROOT -o subvolid=# /mnt/.snapshots
mount /dev/sda# /mnt/boot
```

Generate configuration.nix and hardware-configuration.nix

```
nixos-generate-configuration --root /mnt
```
Replace the genereted `configuration.nix` with the one in `system/configuration.nix`

Enabling the unstable channel
```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
```

Add and update nixos-hardware channel
```
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update
```

Check the configuration.nix and install system with:
```
nixos-install
reboot
```

### Post-installation

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

I use `home.file` to symlink configuration files. I only have a only small collection of dotfiles so it is manageble. The dotfiles that are symlinked are readonly copies of the source file. This means that if you change anything in the source file it will not take effect in the symlinked file, you will have to run `home-manager switch` to make the changes take effect.  
```
home.file = {
  ".config/nushell/config.nu".source = ./dotfiles/.config/nu/config.nu;
  ".config/nvim/init.vim".source = ./dotfiles/.config/nvim/init.vim;
  ".config/vifm".source = ./dotfiles/.config/vifm;
  ".config/zathura".source = ./dotfiles/.config/zathura;
  ".config/tridactyl".source = ./dotfiles/.config/tridactyl;
};
```