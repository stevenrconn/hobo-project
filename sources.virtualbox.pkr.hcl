variable "vbox_hard_drive_interface" {
  type = string
  default = "virtio"
}

variable "vbox_iso_interface" {
  type = string
  default = "virtio"
}

variable "vbox_nic_type" {
  type = string
  default = "virtio"
}

variable "vbox_firmware" {
  type = string
  default = "efi"
}

variable "vbox_vbox_manage" {
  type = list(list(string))
  default =  [
    [ "modifyvm", "{{ .Name }}", "--usbxhci", "on" ]
  ]
}

source "virtualbox-iso" "debian-bullseye" {
    guest_os_type         = "${local.arch == "aarch64" ? "Debian11_arm64" : "Debian11_64" }"
    iso_url               = var.iso.debian-bullseye[local.arch].url
    iso_checksum          = var.iso.debian-bullseye[local.arch].checksum
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "e<wait>",
        "<down><down><down><end>",
        " auto=true",
        " priority=critical",
        " url=http://${var.packer_httpip}:{{ .HTTPPort }}/preseed.cfg<wait>",
        "<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "debian-bookworm" {
    guest_os_type         = "${local.arch == "aarch64" ? "Debian12_arm64" : "Debian12_64" }"
    iso_url               = var.iso.debian-bookworm[local.arch].url
    iso_checksum          = var.iso.debian-bookworm[local.arch].checksum
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "e<wait>",
        "<down><down><down><end>",
        " auto=true",
        " priority=critical",
        " url=http://${var.packer_httpip}:{{ .HTTPPort }}/preseed.cfg<wait>",
        "<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "debian-trixie" {
    guest_os_type         = "${local.arch == "aarch64" ? "Debian13_arm64" : "Debian13_64" }"
    iso_url               = var.iso.debian-trixie[local.arch].url
    iso_checksum          = var.iso.debian-trixie[local.arch].checksum
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "e<wait>",
        "<down><down><down><end>",
        " auto=true",
        " priority=critical",
        " url=http://${var.packer_httpip}:{{ .HTTPPort }}/preseed.cfg<wait>",
        "<f10><wait1m><enter>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "fedora43" {
    guest_os_type         = "${ local.arch == "aarch64" ? "Fedora_arm64" : "Fedora_64" }"
    iso_url               = var.iso.fedora43[local.arch].url
    iso_checksum          = var.iso.fedora43[local.arch].checksum
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora.cfg<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "rhel9-minimal" {
    guest_os_type         = "${ local.arch == "aarch64" ? "RedHat9_arm64" : "RedHat9_64" }"
    iso_url               = var.iso.rhel9[local.arch].url
    iso_checksum          = var.iso.rhel9[local.arch].checksum
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "<up>e<down><down><end>",
        local.fips ? " fips=1" : "",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rhel-minimal.cfg",
        "<f10>"
    ]
    headless = var.packer_headless
}

source "virtualbox-iso" "rhel10-minimal" {
    guest_os_type         = "${ local.arch == "aarch64" ? "RedHat10_arm64" : "RedHat10_64" }"
    iso_url               = var.iso.rhel10[local.arch].url
    iso_checksum          = var.iso.rhel10[local.arch].checksum
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_command          = [
        "<up>e<down><down><end>",
        local.fips ? " fips=1" : "",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rhel-minimal.cfg",
        "<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "rockylinux8" {
    guest_os_type    = "RedHat8_64"
    iso_url          = "${var.iso.rockylinux8.x86_64.url}"
    iso_checksum     = "${var.iso.rockylinux8.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}"
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux8.x86_64.cfg",
        "<enter>"
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "rockylinux8-minimal" {
    guest_os_type    = "RedHat8_64"
    iso_url          = "${var.iso.rockylinux8.x86_64.url}"
    iso_checksum     = "${var.iso.rockylinux8.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}"
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux8-minimal.x86_64.cfg",
        "<enter>"
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "rockylinux9" {
    guest_os_type    = "RedHat9_64"
    iso_url          = "${var.iso.rockylinux9.x86_64.url}"
    iso_checksum     = "${var.iso.rockylinux9.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}"
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux9.x86_64.cfg",
        "<enter>"
    ]
    headless = var.packer_headless
}

source "virtualbox-iso" "rockylinux9-minimal" {
    guest_os_type    = "RedHat9_64"
    iso_url          = "${var.iso.rockylinux9.x86_64.url}"
    iso_checksum     = "${var.iso.rockylinux9.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}"
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux9-minimal.x86_64.cfg",
        "<enter>"
    ]
    headless = var.packer_headless
}

source "virtualbox-iso" "ubuntu-focal" {
    guest_os_type         = "${ local.arch == "aarch64" ? "Linux_arm64" : "Ubuntu20_LTS_64" }"
    iso_url               = var.iso.ubuntu-focal[local.arch].url
    iso_checksum          = var.iso.ubuntu-focal[local.arch].checksum
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_wait             = "15s"
    boot_command          = [
      "e<wait>",
      "<down><down><down><end><wait>",
      " autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'<wait>",
      "<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "ubuntu-jammy" {
    guest_os_type         = "${ local.arch == "aarch64" ? "Ubuntu22_arm64" : "Ubuntu22_LTS_64" }"
    iso_url               = var.iso.ubuntu-jammy[local.arch].url
    iso_checksum          = var.iso.ubuntu-jammy[local.arch].checksum
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_wait             = "15s"
    boot_command          = [
      "e<wait>",
      "<down><down><down><end><wait>",
      " autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'<wait>",
      "<f10>"
    ]
    headless              = var.packer_headless
}

source "virtualbox-iso" "ubuntu-noble" {
    guest_os_type         = "${ local.arch == "aarch64" ? "Ubuntu24_LTS_arm64" : "Ubuntu24_LTS_64" }"
    iso_url               = var.iso.ubuntu-noble[local.arch].url
    iso_checksum          = var.iso.ubuntu-noble[local.arch].checksum
    firmware              = "${var.vbox_firmware}"
    hard_drive_interface  = "${var.vbox_hard_drive_interface}"
    iso_interface         = "${var.vbox_iso_interface}"
    nic_type              = "${var.vbox_nic_type}"
    vboxmanage            = var.vbox_vbox_manage
    cpus                  = var.box_cpus
    memory                = var.box_memory
    disk_size             = var.box_disk_size
    ssh_username          = "vagrant"
    ssh_password          = "vagrant"
    ssh_timeout           = "30m"
    shutdown_command      = "sudo -S systemctl poweroff"
    http_directory        = "${path.root}"
    boot_wait             = "15s"
    boot_command          = [
        "e<wait>",
        "<down><down><down><end><wait>",
        " autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'<wait>",
        "<f10>"
    ]
    headless              = var.packer_headless
}
