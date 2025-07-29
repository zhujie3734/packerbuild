variable "vcenter_server" {
  type    = string
  description = "The hostname of the vCenter server to use for building"
}

variable "vcenter_user" {
  type    = string
  description = "The username to use when connecting to the vCenter"
}

variable "vcenter_password" {
  type    = string
  sensitive = true
  description = "The password for the vCenter user"
}

variable "enable_insecure_con" {
  type = bool
}

variable "vcenter_datacenter" {
  type    = string
  description = "The name of the datacenter within vCenter to build in"
}

variable "vcenter_cluster" {
  type    = string
  description = "The name of the cluster to build in"
}

variable "vcenter_resource_pool" {
  type    = string
  description = "The name of the resource pool to build in"
}

variable "esx_host" {
  type    = string
  description = "The hostname of the ESX to build on"
}

variable "vcenter_datastore" {
  type    = string
  description = "The name of the datastore to build in"
}

variable "vm_folder" {
  type    = string
  description = "The folder of the virtual machines to build on"
}

variable "enable_convert_template" {
  type = bool
}

variable "vmtools_upgrade" {
  type = bool
}

variable "http_ip" {
  type    = string
  description = "The IP address to listen on for the packer HTTP server"
}

variable "http_directory" {
  type    = string
  description = "Directory to store configuration on HTTP server"
}

variable "vm_name" {
  type    = string
  description = "The name of the VM when building"
}

variable "vm_version" {
  type = number
  default = 18
}

variable "os_type" {
  type = string
  description = "guest os version"
}

variable "vcpu_nums" {
  type    = number
  description = "The total number of vcpu for the new template VM"
}

variable "vcpu_per_core" {
  type    = number
  description = "The number of cores for the new template VM"
}

variable "cpu_hotadd" {
  type = bool
}

variable "memsize" {
  type    = number
  description = "The memory size for the template VM in MB"
}

variable "mem_hotadd" {
  type = bool
}

variable "gpu_memsize" {
  type    = number
  description = "The memory size for the template VM in MB"
}

variable "boot_mode" {
  type    = string
  description = "define os boot mode"
}
variable "boot_wait" {
  type    = string
  description = "The time to wait after boot of the VM to start doing anything"
}

variable "boot_command" {
  type    = list(string)
  description = "Commands required to start the automated installation process after booting from ISO"
}

variable "disk_controller" {
  type = list(string)
}

variable "network_adapter_config" {
  type = object({
    network = string
    network_card = string
 })
}

variable "storage" {
  type = object({
    disk_size = number
    disk_thin_provisioned = bool
  })
}

variable "iso_urls" {
  type    = list(string)
  description = "The download url for the installation ISO"
}

variable "iso_checksum" {
  type    = string
  description = "The checksum for the ISO specified in `iso_url`"
}

variable "iso_path" {
  type = list(string)
  description = "path to install vmware tools"
}

variable "cdrom_type" {
  type = string
}

variable "cd_files" {
  type = list(string)
  description = "path to load config files"
}

variable "enable_cd_removal" {
  type = bool
}

variable "communicator_type" {
  type    = string
  description = "define how to remote connect to template"
}

variable "os_user" {
  type    = string
  description = "The username to connect with to the newly delpoyed OS"
}

variable "os_password" {
  type    = string
  sensitive = true
  description = "The password for the OS user to be used when connecting to the deployed VM"
}

variable "remote_port" {
  type    = number
}

variable "winrm_insecure" {
  type = bool
}

variable "shutdown_command" {
  type    = string
  description = "define shutdown command"
}

variable "shutdown_timeout" {
  type = string
}

variable "export_config" {
  type = object({
    force = bool
    output_directory = string
    options = list(string)   
})
}
