{
  config,
  pkgs,
  modulesPath,
  lib,
  ...
}:

with lib;

{
  boot.initrd.kernelModules = mkDefault [ ];

  boot.initrd.availableKernelModules = mkDefault [
    "uhci_hcd"
    "ehci_pci"
    "sd_mod"
    "sr_mod"
    "virtio_pci"
    "virtio_blk"
    "virtio_scsi"
    "virtio_net"
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
  ];
}
