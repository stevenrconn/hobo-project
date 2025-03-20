box_cpus           = 1
box_memory         = 2048
box_disk_size      = 32768
box_nic_type       = "virtio"
box_name_prefix    = "hobo/"

iso = {
    debian-bullseye = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://get.debian.org/images/archive/11.3.0/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso"
            checksum = "7892981e1da216e79fb3a1536ce5ebab157afdd20048fe458f2ae34fbc26c19b"
        }
    },
    debian-bookworm = {
        aarch64 = {
            url = "https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/debian-12.10.0-arm64-netinst.iso"
            checksum = "98b41e276dc41478c43298ee149f05ad446aa736273aaa653a39d64dab65a6a4"
        }
        x86_64 = {
            url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.10.0-amd64-netinst.iso"
            checksum = "ee8d8579128977d7dc39d48f43aec5ab06b7f09e1f40a9d98f2a9d149221704a"
        }
    },
    fedora40 = {
        aarch64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/aarch64/iso/Fedora-Server-netinst-aarch64-40-1.14.iso"
            checksum = "690731ac6abba81413d97517baa80841cb122d07b296ec3f2935848be45be8fe"
        }
        x86_64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/x86_64/iso/Fedora-Server-netinst-x86_64-40-1.14.iso"
            checksum = "1b4f163c55aa9b35bb08f3d465534aa68899a4984b8ba8976b1e7b28297b61fe"
        }
    },    
    fedora41 = {
        aarch64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/aarch64/iso/Fedora-Server-netinst-aarch64-41-1.4.iso"
            checksum = "9fff15b2be224e7f2f12defe7901eed0255c6611e4f87c6fb322081296801641"
        }
        x86_64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/x86_64/iso/Fedora-Server-netinst-x86_64-41-1.4.iso"
            checksum = "630c52ba9e7a7f229b026e241ba74b9bc105e60ba5bf7b222693ae0e25f05c97"
        }
    },    
    rhel8 = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "./isos/rhel-8.10-x86_64-dvd.iso"
            checksum = "9b3c8e31bc2cdd2de9cf96abb3726347f5840ff3b176270647b3e66639af291b"
        }
    },
    rhel9 = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "./isos/rhel-9.5-x86_64-dvd.iso"
            checksum = "0bb7600c3187e89cebecfcfc73947eb48b539252ece8aab3fe04d010e8644ea9"
        }
    },
    rhel10 = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "./isos/rhel-10.0-beta-x86_64-dvd.iso"
            checksum = "f837ceb4e481aa630f83b2151bb41c9fa5043b1460305d52a0e00646466ed4ac"
        }
    },
    rockylinux8 = {
        aarch64 = {
            url = "https://download.rockylinux.org/pub/rocky/8/isos/aarch64/Rocky-aarch64-boot.iso"
            checksum = "19dc9852f269306600c73e9fc1a6b24ea986b8e4c44ad027064954096d7e720e"
        }
        x86_64 = {
            url = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-boot.iso"
            checksum = "203744a255ea6579e49ca7f7f0f17e2fda94e50945d8183a254490e454c7c5b4"
        }
    },
    rockylinux9 = {
        aarch64 = {
            url = "https://download.rockylinux.org/pub/rocky/9/isos/aarch64/Rocky-aarch64-boot.iso"
            checksum = "c6244d1a94ddf1e91ea68f2667aaed218a742a985abb76c3486a85b72819d9e2"
        }
        x86_64 = {
            url = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.5-x86_64-boot.iso"
            checksum = "628c069c9685477360640a6b58dc919692a11c44b49a50a024b5627ce3c27d5f"
        }
    }
    ubuntu-focal = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://www.releases.ubuntu.com/focal/ubuntu-20.04.6-live-server-amd64.iso"
            checksum = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
        }
    },
    ubuntu-jammy = {
        aarch64 = {
            url = "https://cdimage.ubuntu.com/releases/jammy/release/ubuntu-22.04.4-live-server-arm64.iso"
            checksum = "74b8a9f71288ae0ac79075c2793a0284ef9b9729a3dcf41b693d95d724622b65"
        }
        x86_64 = {
            url = "https://releases.ubuntu.com/releases/22.04.5/ubuntu-22.04.5-live-server-amd64.iso"
            checksum = "9bc6028870aef3f74f4e16b900008179e78b130e6b0b9a140635434a46aa98b0"
        }
    },
    ubuntu-noble = {
        aarch64 = {
            url = "https://cdimage.ubuntu.com/releases/24.04/release/ubuntu-24.04-live-server-arm64.iso"
            checksum = "d2d9986ada3864666e36a57634dfc97d17ad921fa44c56eeaca801e7dab08ad7"
        }
        x86_64 = {
            url = "https://releases.ubuntu.com/noble/ubuntu-24.04.2-live-server-amd64.iso"
            checksum = "d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d"
        }
    }                
}
