box_cpus           = 1
box_memory         = 2048
box_disk_size      = 32768
box_nic_type       = "virtio"

iso = {
    redhat8 = {
        url = "",
        checksum = ""
    },
    redhat9 = {
        url = "",
        checksum = ""
    },
    rockylinux8 = {
        url = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-boot.iso",
        checksum = "96c9d96c33ebacc8e909dcf8abf067b6bb30588c0c940a9c21bb9b83f3c99868"
    },
    rockylinux9 = {
        url = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-x86_64-boot.iso",
        checksum = "11e42da96a7b336de04e60d05e54a22999c4d7f3e92c19ebf31f9c71298f5b42"
    },
    ubuntu-focal = {
        url = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso",
        checksum = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
    },
    ubuntu-jammy = {
        url = "https://releases.ubuntu.com/releases/22.04.2/ubuntu-22.04.2-live-server-amd64.iso",
        checksum = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
    },
    ubuntu-lunar = {
        url = "https://releases.ubuntu.com/23.04/ubuntu-23.04-live-server-amd64.iso",
        checksum = "c7cda48494a6d7d9665964388a3fc9c824b3bef0c9ea3818a1be982bc80d346b"
    }                
}