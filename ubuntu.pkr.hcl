source "virtualbox-iso" "ubunto20lts" {
    guest_os_type    = "Ubuntu20_LTS_64"
    iso_url          = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso"
    iso_checksum     = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "ubuntu"
    ssh_password     = "ubuntu"
    ssh_timeout      = "30m"
    shutdown_command = "sudo systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=${var.packer_http_ip}:{{ .HTTPPort }}/ks-rockylinux8.cfg",
        "<enter>"
    ]
    // headless         = true
}