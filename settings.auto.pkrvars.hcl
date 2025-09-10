box_cpus           = 1
box_memory         = 2048
box_disk_size      = 32768
box_nic_type       = "virtio"

iso = {
    debian-bullseye = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        i386 = {
            url = ""
            checksum = ""
        }        
        x86_64 = {
            url = "https://cdimage.debian.org/images/archive/11.11.0/amd64/iso-cd/debian-11.11.0-amd64-netinst.iso"
            checksum = "cd5b2a6fc22050affa1d141adb3857af07e94ff886dca1ce17214e2761a3b316"
        }
    },
    debian-bookworm = {
        aarch64 = {
            url = "https://cdimage.debian.org/images/archive/12.12.0/arm64/iso-cd/debian-12.12.0-arm64-netinst.iso"
            checksum = "5c050c495770ee9b076261cb8025a99a4866a15a4e3cdab2f59c49e8f69fb0ee"
        }
        i386 = {
            url = "https://cdimage.debian.org/images/archive/12.12.0/i386/iso-cd/debian-12.12.0-i386-netinst.iso"
            checksum = "b6bfd200581c949e55f2e8d106dd9a2ecf27b5fb4018e934fe96e1b9a87767ba"
        }
        x86_64 = {
            url = "https://cdimage.debian.org/images/archive/12.12.0/amd64/iso-cd/debian-12.12.0-amd64-netinst.iso"
            checksum = "dfc30e04fd095ac2c07e998f145e94bb8f7d3a8eca3a631d2eb012398deae531"
        }
    },
    debian-trixie = {
        aarch64 = {
            url = "https://cdimage.debian.org/debian-cd/13.1.0/arm64/iso-cd/debian-13.1.0-arm64-netinst.iso"
            checksum = "5c050c495770ee9b076261cb8025a99a4866a15a4e3cdab2f59c49e8f69fb0ee"
        }
        i386 = {
            url = "https://cdimage.debian.org/debian-cd/13.1.0/i386/iso-cd/debian-13.1.0-i386-netinst.iso"
            checksum = "98c665957ce22ce189dcafcc5885781a5843810bb7e23df77a811e02b17380da"
        }
        x86_64 = {
            url = "https://cdimage.debian.org/debian-cd/13.1.0/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso"
            checksum = "658b28e209b578fe788ec5867deebae57b6aac5fce3692bbb116bab9c65568b3"
        }
    },
    fedora41 = {
        aarch64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/aarch64/iso/Fedora-Server-netinst-aarch64-41-1.4.iso"
            checksum = "9fff15b2be224e7f2f12defe7901eed0255c6611e4f87c6fb322081296801641"
        }
        i386 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/x86_64/iso/Fedora-Server-netinst-x86_64-41-1.4.iso"
            checksum = "630c52ba9e7a7f229b026e241ba74b9bc105e60ba5bf7b222693ae0e25f05c97"
        }
    },    
    fedora42 = {
        aarch64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/42/Server/aarch64/iso/Fedora-Server-netinst-aarch64-42-1.1.iso"
            checksum = "cbeeb6d0147ce198e28895a9bbc91cd49a964f38177a57d512f73492308533ed"
        }
        i386 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/42/Server/x86_64/iso/Fedora-Server-netinst-x86_64-42-1.1.iso"
            checksum = "231f3e0d1dc8f565c01a9f641b3d16c49cae44530074bc2047fe2373a721c82f"
        }
    },    
    rhel8 = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        i386 = {
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
        i386 = {
            url = ""
            checksum = ""
        }    
        x86_64 = {
            url = "./isos/rhel-9.6-x86_64-dvd.iso"
            checksum = "febcc1359fd68faceff82d7eed8d21016e022a17e9c74e0e3f9dc3a78816b2bb"
        }
    },
    rhel10 = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        i386 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "./isos/rhel-10.0-x86_64-dvd.iso"
            checksum = "edce2dd6f8e1d1b2ff0b204f89b0659bc9e320d175beb7caad60712957a19608"
        }
    },
    rockylinux8 = {
        aarch64 = {
            url = "https://download.rockylinux.org/pub/rocky/8/isos/aarch64/Rocky-aarch64-boot.iso"
            checksum = "19dc9852f269306600c73e9fc1a6b24ea986b8e4c44ad027064954096d7e720e"
        }
        i386 = {
            url = ""
            checksum = ""
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
        i386 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9.6-x86_64-boot.iso"
            checksum = "0fad8d8b19a94a0222ea37152cdf5601229fe0178b651dc476e1cba41d2e6067"
        }
    }
    ubuntu-focal = {
        aarch64 = {
            url = ""
            checksum = ""
        }
        i386 = {
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
            url = "https://cdimage.ubuntu.com/releases/jammy/release/ubuntu-22.04.5-live-server-arm64.iso"
            checksum = "eafec62cfe760c30cac43f446463e628fada468c2de2f14e0e2bc27295187505"
        }
        i386 = {
            url = ""
            checksum = ""
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
        i386 = {
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://releases.ubuntu.com/noble/ubuntu-24.04.3-live-server-amd64.iso"
            checksum = "c3514bf0056180d09376462a7a1b4f213c1d6e8ea67fae5c25099c6fd3d8274b"
        }
    }                
}
