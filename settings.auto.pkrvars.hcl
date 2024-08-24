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
            url = ""
            checksum = ""
        }
        x86_64 = {
            url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso"
            checksum = "64d727dd5785ae5fcfd3ae8ffbede5f40cca96f1580aaa2820e8b99dae989d94"
        }
    },
    fedora40 = {
        aarch64 = {
            url = "https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/aarch64/iso/Fedora-Server-netinst-aarch64-40-1.14.iso"
            checksum = "690731ac6abba81413d97517baa80841cb122d07b296ec3f2935848be45be8fe"
        }
        x86_64 = {
            url = ""
            checksum = ""
        }
    },    
    rockylinux8 = {
        aarch64 = {
            url = "https://download.rockylinux.org/pub/rocky/8/isos/aarch64/Rocky-aarch64-boot.iso"
            checksum = "19dc9852f269306600c73e9fc1a6b24ea986b8e4c44ad027064954096d7e720e"
        }
        x86_64 = {
            url = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-boot.iso"
            checksum = "96c9d96c33ebacc8e909dcf8abf067b6bb30588c0c940a9c21bb9b83f3c99868"
        }
    },
    rockylinux9 = {
        aarch64 = {
            url = "https://download.rockylinux.org/pub/rocky/9/isos/aarch64/Rocky-9.4-aarch64-boot.iso"
            checksum = "c6244d1a94ddf1e91ea68f2667aaed218a742a985abb76c3486a85b72819d9e2"
        }
        x86_64 = {
            url = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-x86_64-boot.iso"
            checksum = "11e42da96a7b336de04e60d05e54a22999c4d7f3e92c19ebf31f9c71298f5b42"
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
            url = "https://releases.ubuntu.com/releases/22.04.4/ubuntu-22.04.4-live-server-amd64.iso"
            checksum = "45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
        }
    },
    ubuntu-noble = {
        aarch64 = {
            url = "https://cdimage.ubuntu.com/releases/24.04/release/ubuntu-24.04-live-server-arm64.iso"
            checksum = "d2d9986ada3864666e36a57634dfc97d17ad921fa44c56eeaca801e7dab08ad7"
        }
        x86_64 = {
            url = "https://releases.ubuntu.com/24.04/ubuntu-24.04-live-server-amd64.iso"
            checksum = "8762f7e74e4d64d72fceb5f70682e6b069932deedb4949c6975d0f0fe0a91be3"
        }
    }                
}