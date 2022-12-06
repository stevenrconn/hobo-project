source "hyperv-iso" "rocky8-minimal" {
    headless            = false

    iso_url             = "http://dl.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-minimal.iso"
    iso_checksum        = "13c3e7fca1fd32df61695584baafc14fa28d62816d0813116d23744f5394624b"

    ssh_username        = "vagrant"
    ssh_password        = "vagrant"
    ssh_timeout         = "30m"
    shutdown_command    = "sudo systemctl poweroff"

    generation          = 1
    disk_size           = 32768
    memory              = 2048
    switch_name         = "Default Switch"

    http_directory      = "${path.root}"
    boot_command = [
        "<up><tab><wait>",
        " fips=1 inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/anaconda-ks.cfg<wait><enter>"
    ]
}

build {
    sources = [ "source.hyperv-iso.rocky8-minimal" ]
}