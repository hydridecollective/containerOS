#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p bash git gum

# root check
if [ "$(id -u)" != "0" ]; then
    echo "hcos-install must be run as root." 1>&2
    exit 1
fi

function partition_chooser() {
    RAW_DEVICE_LIST=$(lsblk -n -l -d -o NAME)
    lsblk -n -l -d -o NAME,SIZE | gum choose --header "select a device"
}

function clean_install() {
    echo "$(gum style --foreground "57" --bold "ROOTFS"): root disk for containerOS"
    ROOTFS=$(partition_chooser)
    gum style --foreground "57" --bold "HYDRIDE: data disk"
    HYDRIDE=$(partition_chooser)

    echo $ROOTFS $HYDRIDE
}

function mainMenu() {
    gum choose --header "select an option" "clean installation" "in-place reinstallation"
}

function welcome() {
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