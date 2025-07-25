variable "vcenter_server" {
  type    = string
  description = "The hostname of the vCenter server to use for building"
  default = "192.168.1.1"
}

variable "vcenter_user" {
  type    = string
  description = "The username to use when connecting to the vCenter"
  default = "administrator@vsphere.local"
}

variable "vcenter_password" {
  type    = string
  sensitive = true
  description = "The password for the vCenter user"
  default = "XXXXXX"
}

variable "enable_insecure_con" {
  type = bool
  default = true
}

variable "vcenter_datacenter" {
  type    = string
  description = "The name of the datacenter within vCenter to build in"
  default = "DC-test"
}

variable "vcenter_cluster" {
  type    = string
  description = "The name of the cluster to build in"
  default = "DC-test-CLUSTER"
}

variable "vcenter_resource_pool" {
  type    = string
  description = "The name of the resource pool to build in"
  default = null
}

variable "esx_host" {
  type    = string
  description = "The hostname of the ESX to build on"
  default = "192.168.1.2"
}

variable "vcenter_datastore" {
  type    = string
  description = "The name of the resource pool to build in"
  default = "LocalStorage01"
}

variable "vm_folder" {
  type    = string
  description = "The folder of the virtual machines to build on"
  default = "Test"
}

variable "enable_convert_template" {
  type = bool
  default = true 
}

variable "http_ip" {
  type    = string
  default = "172.16.1.1"
  description = "The IP address to listen on for the packer HTTP server"
}

variable "http_directory" {
  type    = string
  default = "./resources"
  description = "Directory to store configuration on HTTP server"
}

variable "vm_name" {
  type    = string
  default = "WindowsServer2019_template"
  description = "The name of the VM when building"
}

variable "vm_version" {
  type = number
  description = "hardware compatibility version of virtual machine"
  default = 18
}

variable "os_type" {
  type = string
  description = "guest os version"
  default = "windows2019srv_64Guest"
}

variable "vcpu_nums" {
  type    = number
  default = 4
  description = "The total number of vcpu for the new template VM"
}

variable "vcpu_per_core" {
  type    = number
  default = 4
  description = "The number of cores for the new template VM"
}

variable "cpu_hotadd" {
  type = bool
  default = true
}

variable "memsize" {
  type    = number
  default = 8192
  description = "The memory size for the template VM in MB"
}

variable "mem_hotadd" {
  type = bool
  default = true

}

variable "gpu_memsize" {
  type    = number
  default = 8192
  description = "The memory size for the template VM in MB"
}

variable "boot_mode" {
  type    = string
  default = "efi"
  description = "define os boot mode"
}
variable "boot_wait" {
  type    = string
  default = "3s"
  description = "The time to wait after boot of the VM to start doing anything"
}

variable "boot_command" {
  type    = list(string)
  default = [  "w"
            ]
  description = "Commands required to start the automated installation process after booting from ISO"
}

variable "disk_controller" {
  type = list(string)
  default = ["pvscsi"]
}

variable "network_adapter_config" {
  type = object({
    network = string
    network_card = string
 })
  default = {
    network = "Net-27"
    network_card = "vmxnet3"
  }
}

variable "storage" {
  type = object({
    disk_size = number
    disk_thin_provisioned = bool
  })
  default = {
    disk_size = 153600
    disk_thin_provisioned = true
  }
}

variable "iso_urls" {
  type    = list(string)
  default = ["http://172.16.1.1:8000/SERVER_2019_x64.ISO"]
  description = "The download url for the installation ISO"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:e80947cea3be3e2063db822e24c90a43402b37d1d9a6a744b891ad21fbf44acb"
  description = "The checksum for the ISO specified in `iso_url`"
}

variable "iso_path" {
  type = list(string)
  default = ["[] /vmimages/tools-isoimages/windows.iso"]
  description = "path to install vmware tools"
}

variable "cdrom_type" {
  type = string
  default = "sata"
}

variable "cd_files" {
  type = list(string)
  default = [
    "resources/configs/autounattend.xml",
    "resources/configs/sysprep-autounattend.xml",
    "resources/scripts/install-vmware-tools-from-iso.ps1"
  ]
  description = "path to load config files"
}

variable "enable_cd_removal" {
  type = bool
  default = true
}

variable "communicator_type" {
  type    = string
  default = "winrm"
  description = "define how to remote connect to template"
}

variable "os_user" {
  type    = string
  default = "Administrator"
  description = "The username to connect with to the newly delpoyed OS"
}

variable "os_password" {
  type    = string
  default = "XXXXXX"
  sensitive = true
  description = "The password for the OS user to be used when connecting to the deployed VM"
}

variable "remote_port" {
  type    = number
  default = 5985
}

variable "winrm_insecure" {
  type = bool
  default = true
}

variable "shutdown_command" {
  type    = string
  default = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /shutdown /unattend:F:\\sysprep-autounattend.xml"
  description = "define shutdown command"
}

variable "shutdown_timeout" {
  type = string
  default = "60m"
}

variable "export_config" {
  type = object({
    force = bool
    output_directory = string
    options = list(string)   
})
  default = {
    force = true
    output_directory = "./build"
    options = ["nodevicesubtypes"]
  }
}
