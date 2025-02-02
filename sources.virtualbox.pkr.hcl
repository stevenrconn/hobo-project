source "virtualbox-iso" "debian-bullseye" {
    guest_os_type    = "Debian11_64"
    iso_url          = "${var.iso.debian-bullseye.x86_64.url}"
    iso_checksum     = "${var.iso.debian-bullseye.x86_64.checksum}"
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
        "<esc><wait>",
        "install vmlinuz<wait>",
        " initrd=install/initrd.gz<wait>",
        " auto-install/enable=true<wait>",
        " debconf/priority=critical<wait>",
        " preseed/url=http://${var.packer_httpip}:{{ .HTTPPort }}/preseed.cfg<wait>",
        " -- <wait>",
        "<enter><wait>"
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "debian-bookworm" {
    guest_os_type    = "Debian12_64"
    iso_url          = "${var.iso.debian-bookworm.x86_64.url}"
    iso_checksum     = "${var.iso.debian-bookworm.x86_64.checksum}"
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
        "<esc><wait>",
        "install vmlinuz<wait>",
        " initrd=install/initrd.gz<wait>",
        " auto-install/enable=true<wait>",
        " debconf/priority=critical<wait>",
        " preseed/url=http://${var.packer_httpip}:{{ .HTTPPort }}/preseed.cfg<wait>",
        " -- <wait>",
        "<enter><wait>"
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "fedora40" {
    guest_os_type    = "Fedora_64"
    iso_url          = "${var.iso.fedora40.x86_64.url}"
    iso_checksum     = "${var.iso.fedora40.x86_64.checksum}"
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
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora40.cfg<f10>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "fedora40-minimal" {
    guest_os_type    = "Fedora_64"
    iso_url          = "${var.iso.fedora40.x86_64.url}"
    iso_checksum     = "${var.iso.fedora40.x86_64.checksum}"
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
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora40-minimal.cfg<f10>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "fedora41" {
    guest_os_type    = "Fedora_64"
    iso_url          = "${var.iso.fedora41.x86_64.url}"
    iso_checksum     = "${var.iso.fedora41.x86_64.checksum}"
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
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora41.cfg<f10>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "fedora41-minimal" {
    guest_os_type    = "Fedora_64"
    iso_url          = "${var.iso.fedora41.x86_64.url}"
    iso_checksum     = "${var.iso.fedora41.x86_64.checksum}"
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
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora41-minimal.cfg<f10>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "rhel9-minimal" {
    guest_os_type    = "RedHat9_64"
    iso_url          = "${var.iso.rhel9.x86_64.url}"
    iso_checksum     = "${var.iso.rhel9.x86_64.checksum}"
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
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rhel-minimal.x86_64.cfg",
        "<enter>"
    ]
    headless = var.packer_headless
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
    guest_os_type    = "Ubuntu20_LTS_64"
    iso_url          = "${var.iso.ubuntu-focal.x86_64.url}"
    iso_checksum     = "${var.iso.ubuntu-focal.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "<enter><enter><f6><esc><wait> ",
        "autoinstall ds=nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/",
        "<enter>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "ubuntu-jammy" {
    guest_os_type    = "Ubuntu22_LTS_64"
    iso_url          = "${var.iso.ubuntu-jammy.x86_64.url}"
    iso_checksum     = "${var.iso.ubuntu-jammy.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "c",
        "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'",
        "<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "ubuntu-noble" {
    guest_os_type    = "Ubuntu24_LTS_64"
    iso_url          = "${var.iso.ubuntu-noble.x86_64.url}"
    iso_checksum     = "${var.iso.ubuntu-noble.x86_64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "c",
        "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'",
        "<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>"   
    ]
    headless         = var.packer_headless
}