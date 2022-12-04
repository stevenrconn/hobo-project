source "hyperv-iso" "rocky8-minimal" {
    iso_url             = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.7-x86_64-dvd1.iso"
    iso_checksum        = "4827dce1c58560d3ca470a5053e8d86ba059cbb77cfca3b5f6a5863d2aac5b84"

    ssh_username        = "vagrant"
    ssh_password        = "vagrant"
    shutdown_command    = "systemctl poweroff"

    generation          = 2
    disk_size           = 32768
    memory              = 2048
    switch_name         = "Default Switch"

    http_directory      = "${path.root}"
    boot_command = [
        "e<wait><down><down><down><left>",
        " fips=1 inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/anaconda-ks.cfg",
        "<leftCtrlOn>x<leftCtrlOff>"
    ]
}

build {
    sources = [ "source.hyperv-iso.rocky8-minimal" ]
}