variable "packer_http_ip" {
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

variable "vagrant_ssh_pubkey" {
    type = string
    sensitive = true
}