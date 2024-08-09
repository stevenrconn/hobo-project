packer {
    required_plugins {
        vagrant = {
            source  = "github.com/hashicorp/vagrant"
            version = "~> 1"
        }
        virtualbox = {
            source  = "github.com/hashicorp/virtualbox"
            version = "~> 1" 
        }
        parallels = {
            version = ">= 1.1.5"
            source  = "github.com/parallels/parallels"
        }
    }
}