variable "packer_http_ip" {
    type = string
    default = "{{ .HTTPIP }}"
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