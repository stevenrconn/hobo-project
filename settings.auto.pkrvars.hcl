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
        url = "https://www.releases.ubuntu.com/focal/ubuntu-20.04.6-live-server-amd64.iso",
        checksum = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
    },
    ubuntu-jammy = {
        url = "https://releases.ubuntu.com/releases/22.04.3/ubuntu-22.04.3-live-server-amd64.iso",
        checksum = "a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
    },
    ubuntu-lunar = {
        url = "https://releases.ubuntu.com/23.04/ubuntu-23.04-live-server-amd64.iso",
        checksum = "c7cda48494a6d7d9665964388a3fc9c824b3bef0c9ea3818a1be982bc80d346b"
    }                
}

vagrant_cloud_token = "v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL"