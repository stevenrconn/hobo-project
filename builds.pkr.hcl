build {
    sources = [ 
        // Parallels sources
        "source.parallels-iso.fedora40",
        "source.parallels-iso.fedora40-minimal",
        "source.parallels-iso.fedora41",
        "source.parallels-iso.fedora41-minimal",
        "source.parallels-iso.rockylinux9",
        "source.parallels-iso.rockylinux9-minimal",
        "source.parallels-iso.ubuntu-jammy",
        "source.parallels-iso.ubuntu-noble",

        // VirtualBox sources
        "source.virtualbox-iso.debian-bullseye",
        "source.virtualbox-iso.debian-bookworm",
        "source.virtualbox-iso.fedora40",
        "source.virtualbox-iso.fedora40-minimal",
        "source.virtualbox-iso.fedora41",
        "source.virtualbox-iso.fedora41-minimal",
        "source.virtualbox-iso.rhel8-minimal",
        "source.virtualbox-iso.rhel9-minimal",
        "source.virtualbox-iso.rockylinux8",
        "source.virtualbox-iso.rockylinux8-minimal",
        "source.virtualbox-iso.rockylinux9",
        "source.virtualbox-iso.rockylinux9-minimal",
        "source.virtualbox-iso.ubuntu-focal",
        "source.virtualbox-iso.ubuntu-jammy",
        "source.virtualbox-iso.ubuntu-noble"
    ]

    // Update/reboot VM - Debian/Ubuntu
    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        expect_disconnect = true
        only = [
            "parallels-iso.ubuntu-jammy",
            "parallels-iso.ubuntu-noble",
            "virtualbox-iso.debian-bullseye",
            "virtualbox-iso.debian-bookworm",  
            "virtualbox-iso.ubuntu-focal",
            "virtualbox-iso.ubuntu-jammy",
            "virtualbox-iso.ubuntu-noble"      
        ]
        inline = [
            "set -o xtrace",
            "apt-get update",
            "apt-get --assume-yes upgrade",
            "apt-get --assume-yes install bzip2",
            "systemctl reboot"
        ]
    }

    // Update/reboot VM - Fedora/Rocky Linux
    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        expect_disconnect = true
        only = [
            "parallels-iso.fedora40",
            "parallels-iso.fedora40-minimal",
            "parallels-iso.fedora41",
            "parallels-iso.fedora41-minimal",
            "parallels-iso.rockylinux9",
            "parallels-iso.rockylinux9-minimal",
            "virtualbox-iso.fedora40",
            "virtualbox-iso.fedora40-minimal",
            "virtualbox-iso.fedora41",
            "virtualbox-iso.fedora41-minimal",
            "virtualbox-iso.rockylinux8",
            "virtualbox-iso.rockylinux8-minimal",
            "virtualbox-iso.rockylinux9",
            "virtualbox-iso.rockylinux9-minimal"
        ]
        inline = [
            "set -o xtrace",
            "dnf --assumeyes upgrade",
            "dnf clean all",
            "systemctl reboot"
        ]
    }

    // Apply Vagrant provisioning
    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        pause_before = "60s"
        inline = [
            "set -o xtrace",
            "hostnamectl set-hostname ${source.name}",
            "mkdir --parents /home/vagrant/.ssh",
            "echo \"${var.vagrant_ssh_pubkey}\" >> /home/vagrant/.ssh/authorized_keys",
            "chown -R vagrant:vagrant /home/vagrant/.ssh",
            "chmod -R go-rwX /home/vagrant/.ssh"
        ]
    }

    // Install Parallels Tools for non-minimal Parallels builds
    provisioner "shell" {
        only = [
            "parallels-iso.fedora40",
            "parallels-iso.fedora41",
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

    // Install VirtualBox Guest Additions prerequisites for Fedora/Rocky Linux
    provisioner "shell" {
        only = [
            "virtualbox-iso.fedora40",
            "virtualbox-iso.fedora41",
            "virtualbox-iso.rockylinux8",
            "virtualbox-iso.rockylinux9"
        ]
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        inline = [
            "set -o xtrace",
            "dnf --assumeyes install tar bzip2 gcc make kernel-devel",
            "dnf clean all"
        ]
    }

    // Install VirtualBox Guest Additions for non-minimal VirtualBox builds
    provisioner "shell" {
        only = [
            "virtualbox-iso.debian-bullseye",
            "virtualbox-iso.debian-bookworm",
            "virtualbox-iso.fedora40",
            "virtualbox-iso.fedora41",
            "virtualbox-iso.rockylinux8",
            "virtualbox-iso.rockylinux9",
            "virtualbox-iso.ubuntu-focal",
            "virtualbox-iso.ubuntu-jammy",
            "virtualbox-iso.ubuntu-noble"
        ]
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        valid_exit_codes = [ 0, 2 ]
        inline = [
            "set -o xtrace",
            "mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt",
            "/mnt/VBoxLinuxAdditions.run --nox11 --quiet --accept",
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