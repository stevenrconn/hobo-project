variable "packer_httpip" {
    type = string
    default = "{{ .HTTPIP }}"
}

variable "packer_headless" {
    type = bool
    default = true
}

variable "box_memory" {
    type = number
    default = 2048
}

variable "box_cpus" {
    type = number
    default = 1
}

variable "box_disk_size" {
    type = number
    default = 32768
}

variable "box_nic_type" {
    type = string
}

variable "box_name_prefix" {
    type = string
}

variable "box_arch" {
    type = string
}

variable "vagrant_ssh_pubkey" {
    type = string
    sensitive = true
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ=="
}

variable "iso" {
    type = map(object({
        aarch64 = object({
            url = string
            checksum = string
        })
        i386 = object({
            url = string
            checksum = string
        })
        x86_64 = object({
            url = string
            checksum = string
        })
    }))
    // type = map(object({
    //     url = string
    //     checksum = string
    // }))
}
