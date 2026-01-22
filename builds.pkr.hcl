build {
    sources = [
        "source.virtualbox-iso.debian-bullseye",
        "source.virtualbox-iso.debian-bookworm",
        "source.virtualbox-iso.debian-trixie",
        "source.virtualbox-iso.fedora43",
        "source.virtualbox-iso.rhel9-minimal",
        "source.virtualbox-iso.rhel10-minimal",
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
            "virtualbox-iso.debian-bullseye",
            "virtualbox-iso.debian-bookworm",
            "virtualbox-iso.debian-trixie",
            "virtualbox-iso.ubuntu-focal",
            "virtualbox-iso.ubuntu-jammy",
            "virtualbox-iso.ubuntu-noble"
        ]
        inline = [
            "set -o xtrace",
            "export DEBIAN_FRONTEND=noninteractive",
            "apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update",
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
            "virtualbox-iso.fedora42",
            "virtualbox-iso.fedora42-minimal",
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

    // Install VirtualBox Guest Additions prerequisites for Fedora/Rocky Linux
    provisioner "shell" {
        only = [
            "virtualbox-iso.fedora43",
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
            "virtualbox-iso.debian-trixie",
            "virtualbox-iso.fedora43",
            "virtualbox-iso.rockylinux8",
            "virtualbox-iso.rockylinux9",
            "virtualbox-iso.ubuntu-focal",
            "virtualbox-iso.ubuntu-jammy",
            "virtualbox-iso.ubuntu-noble"
        ]
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        valid_exit_codes = [ 0, 1, 2 ]
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
