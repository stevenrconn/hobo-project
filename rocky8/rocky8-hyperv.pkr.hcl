variable "vagrant_pubkey" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
}

source "hyperv-iso" "rocky8-minimal" {
    headless            = false

    iso_url             = "http://dl.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-minimal.iso"
    iso_checksum        = "13c3e7fca1fd32df61695584baafc14fa28d62816d0813116d23744f5394624b"

    ssh_username        = "root"
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
    output_directory    = "${path.root}/box"
}

source "virtualbox-iso" "rocky8-minimal" {
    guest_os_type       = "RedHat8_64"
    
    headless            = false

    iso_url             = "http://dl.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-minimal.iso"
    iso_checksum        = "13c3e7fca1fd32df61695584baafc14fa28d62816d0813116d23744f5394624b"

    ssh_username        = "root"
    ssh_password        = "vagrant"
    ssh_timeout         = "30m"
    shutdown_command    = "sudo systemctl poweroff"

    // generation          = 1
    disk_size           = 32768
    memory              = 2048
    // switch_name         = "Default Switch"

    floppy_files        = [ "${path.root}/ks.cfg" ]
    floppy_label        = "OEMDRV"
    boot_command = [
        "<up><tab><wait>",
        " fips=1<wait><enter>"
    ]
    output_directory    = "${path.root}/box"
}

build {
    sources = [ 
        "source.hyperv-iso.rocky8-minimal",
        "source.virtualbox-iso.rocky8-minimal" 
    ]

    provisioner "shell" {
        inline = [
            "mkdir --parents /home/vagrant/.ssh",
            "echo \"${var.vagrant_pubkey}\" >/home/vagrant/.ssh/authorized_keys",
            "chown -R vagrant:vagrant /home/vagrant/.ssh",
            "chmod -R go-rwX /home/vagrant/.ssh",
            "echo \"vagrant ALL=(ALL) NOPASSWD: ALL\" >/etc/sudoers.d/vagrant",
            "chmod 640 /etc/sudoers.d/vagrant"
        ]
    }

    post-processor "shell-local" {
        inline = [
            "cp ${path.root}/metadata.json ${path.root}/box",
            "tar -C ${path.root}/box -czvf ${path.root}/${build.name}.box .",
            "vagrant box add --name hoboproject/${build.name} ${build.name}.box"
        ]
    }
}