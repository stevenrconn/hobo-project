build {
    sources = [ 
        // Parallels sources
        "source.parallels-iso.fedora40",
        "source.parallels-iso.fedora40-minimal",
        "source.parallels-iso.rockylinux8",
        "source.parallels-iso.rockylinux8-minimal",
        "source.parallels-iso.rockylinux9",
        "source.parallels-iso.rockylinux9-minimal",
        "source.parallels-iso.ubuntu-jammy",
        "source.parallels-iso.ubuntu-noble",

        // VirtualBox sources
        "source.virtualbox-iso.debian-bullseye",
        "source.virtualbox-iso.debian-bookworm",
        "source.virtualbox-iso.fedora40",
        "source.virtualbox-iso.fedora40-minimal",
        "source.virtualbox-iso.rockylinux8",
        "source.virtualbox-iso.rockylinux8-minimal",
        "source.virtualbox-iso.rockylinux9",
        "source.virtualbox-iso.rockylinux9-minimal",
        "source.virtualbox-iso.ubuntu-focal",
        "source.virtualbox-iso.ubuntu-jammy",
        "source.virtualbox-iso.ubuntu-noble"
    ]

    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        inline = [
            "set -o xtrace",
            "hostnamectl set-hostname ${source.name}",
            "mkdir --parents /home/vagrant/.ssh",
            "echo \"${var.vagrant_ssh_pubkey}\" >> /home/vagrant/.ssh/authorized_keys",
            "chown -R vagrant:vagrant /home/vagrant/.ssh",
            "chmod -R go-rwX /home/vagrant/.ssh"
        ]
    }

    provisioner "shell" {
        only = [
            "parallels-iso.fedora40",
            "parallels-iso.rockylinux8",
            "parallels-iso.rockylinux9",
            "parallels-iso.ubuntu-jammy",
            "parallels-iso.ubuntu-noble"
        ]
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        inline = [
            "set -o xtrace",
            "mount -o loop /home/vagrant/prl-tools.iso /mnt",
            "/mnt/install --install-unattended",
            "umount /mnt"
        ]
    }

    provisioner "shell" {
        only = [
            "source.virtualbox-iso.rockylinux8",
            "source.virtualbox-iso.rockylinux9"
        ]
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        inline = [
            "set -o xtrace",
            "dnf --assumeyes --allowerasing install tar bzip2 gcc make kernel-devel",
            "mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt",
            "/mnt/VBoxLinuxAdditions.run",
            "umount /mnt"
        ]
    }

    post-processors {
        post-processor "vagrant" {
            name = "box"
            output = "${path.root}/boxes/{{ .BuildName }}-{{ .Provider }}.box"
        }
        post-processor "manifest" {
            name = "manifest"
            output = "${path.root}/${source.name}-${source.type}.json"
        }
        post-processor "shell-local" {
            name = "deploy"
            env = {
                MANIFEST = "${path.root}/${source.name}-${source.type}.json"
                PREFIX = "${var.box_name_prefix}"
            }
            script = "${path.root}/deploy.sh"
        }
    }
}