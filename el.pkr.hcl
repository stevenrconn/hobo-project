source "virtualbox-iso" "rockylinux8" {
    guest_os_type    = "RedHat8_64"
    iso_url          = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.8-x86_64-boot.iso"
    iso_checksum     = "96c9d96c33ebacc8e909dcf8abf067b6bb30588c0c940a9c21bb9b83f3c99868"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=${var.packer_http_ip}:{{ .HTTPPort }}/ks-rockylinux8.cfg",
        "<enter>"
    ]
    headless         = true
}

source "virtualbox-iso" "rockylinux9" {
    guest_os_type    = "RedHat9_64"
    iso_url          = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.2-x86_64-boot.iso"
    iso_checksum     = "11e42da96a7b336de04e60d05e54a22999c4d7f3e92c19ebf31f9c71298f5b42"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=${var.packer_http_ip}:{{ .HTTPPort }}/ks-rockylinux9.cfg",
        "<enter>"
    ]
    headless = true
}

build {
    sources = [ 
        "source.virtualbox-iso.rockylinux8",
        "source.virtualbox-iso.rockylinux9" 
    ]

    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        expect_disconnect = true
        inline = [
            "set -o xtrace",
            "dnf --assumeyes update",
            "dnf --assumeyes clean all",
            "systemctl reboot"
        ]
    }

    // Generate Vagrant box
    post-processor "vagrant" {

    }
}