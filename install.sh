#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p bash git gum disko

# root check
if [ "$(id -u)" != "0" ]; then
    echo "hcos-install must be run as root." 1>&2
    exit 1
fi

# clone repository
rm -rf /tmp/hcos
git clone https://forge.hydride.dev/infrastructure/containerOS.git /tmp/hcos

function partition_chooser() {
    RAW_DEVICE_LIST=$(lsblk -n -l -d -o NAME)
    lsblk -n -l -d -o NAME,SIZE | gum choose --header "select a device" | cut -d' ' -f1
}

function chroot_init() {
    ROOTFS_MOUNT=$(lsblk -J "/dev/$ROOTFS" | jq -r --argjson part "2" '.blockdevices[0].children[1].name')
    HYDRIDE_MOUNT=$(lsblk -J "/dev/$HYDRIDE" | jq -r --argjson part "2" '.blockdevices[0].children[0].name')

    # mount partitions
    mount -o subvol=@ /dev/$ROOTFS_MOUNT /mnt
    mount -o subvol=@home /dev/$ROOTFS_MOUNT /mnt/home
    mount -o subvol=@nix /dev/$ROOTFS_MOUNT /mnt/nix
    mount -o subvol=@hydride /dev/$HYDRIDE_MOUNT /mnt/hydride
    mount -o subvol=@hydride/os-meta /dev/$HYDRIDE_MOUNT /mnt/hydride/os-meta
    mount -o subvol=@hydride/containers /dev/$HYDRIDE_MOUNT /mnt/hydride/containers
}

function install_layout() {
    echo "$(gum style --foreground "10" --bold "/ (rootfs)"): root disk for containerOS"
    ROOTFS=$(partition_chooser)
    echo "$(gum style --foreground "57" --bold "/hydride (hydride)"): data disk"
    HYDRIDE=$(partition_chooser)

    # check if both partitions were selected
    if [ "$ROOTFS" == "" ] || [ "$HYDRIDE" == "" ]; then
        install_layout
    fi

    echo "selected options:"
    current_layout
}

function current_layout() {
    echo "$(gum style --foreground "10" --bold "/ (rootfs)"): $ROOTFS"
    echo "$(gum style --foreground "57" --bold "/hydride (hydride)"): $HYDRIDE"
}

function clean_install() {
    install_layout

    CONFIRM_LAYOUT=$(gum confirm "confirm layout?"; echo $?)

    # check if status code was false (1)
    if [ "$CONFIRM_LAYOUT" == "1" ]; then
        clean_install
    fi

    echo ""
    echo "are you sure you want to continue with this installation using the following layout?"
    current_layout
    echo -e "\e[31mthis will delete EVERYTHING from the above selected devices!\e[0m"
    echo ""
    
    CONFIRM_INSTALL=$(gum confirm "proceed with installation?"; echo $?)
    
    if [ "$CONFIRM_INSTALL" == "1" ]; then
        echo "aborting" 1>&2
        welcome
    fi

    clear

    # run installation
    disko-install --mode format --flake /tmp/hcos/src#default --disk "rootfs" "/dev/$ROOTFS" --disk "hydride" "/dev/$HYDRIDE"
    chroot_init
}

function mainMenu() {
    gum choose --header "select an option" "clean installation" "in-place reinstallation" "quit"
}

function welcome() {
    clear
    gum style \
	--foreground "57" --border-foreground "57" --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	"hcos-install" "the hydride containerOS installation tool"

    CHOSEN_OPTION=$(mainMenu)

    if [ "$CHOSEN_OPTION" == "clean installation" ]; then
        clean_install
    elif [ "$CHOSEN_OPTION" == "in-place reinstallation" ]; then
        inplace_install
    else
        exit 2
    fi
}

#git clone https://forge.hydride.dev/infrastructure/containerOS.git ~/flake
#sudo disko --mode disko --flake ~/flake/src#default
#sudo nixos-install --no-channel-copy --no-root-password --flake ~/flake/src#default

welcome