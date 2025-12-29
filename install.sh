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
    lsblk -n -l -d -o NAME,SIZE | gum choose --header "select a device" | cut -d' ' -f1
}

function install_layout() {
    echo "$(gum style --foreground "10" --bold "/ (rootfs)"): root disk for containerOS"
    ROOTFS=$(partition_chooser)
    echo "$(gum style --foreground "57" --bold "/hydride (hydride)"): data disk"
    HYDRIDE=$(partition_chooser)

    echo "selected options:"
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

    echo "are you sure you want to continue with this installation?"
    echo "$(gum style --foreground "10" --bold "/ (rootfs)"): $ROOTFS"
    echo "$(gum style --foreground "57" --bold "/hydride (hydride)"): $HYDRIDE"
    echo -e "\e[31mthis will delete EVERYTHING from the above selected devices!\e[0m"
    
    CONFIRM_INSTALL=$(gum confirm "proceed with installation?"; echo $?)
    
    if [ "$CONFIRM_INSTALL" == "1" ]; then
        echo "aborting" 1>&2
        exit 1
    fi
    
    echo $ROOTFS $HYDRIDE $CONFIRM_LAYOUT $CONFIRM_INSTALL
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