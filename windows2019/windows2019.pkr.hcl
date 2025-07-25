packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vsphere = {
      version = ">= 1.0.0"
      source = "github.com/hashicorp/vsphere"
    }
  }
}

source "vsphere-iso" "win2019" {
  vcenter_server = var.vcenter_server
  username = var.vcenter_user
  password = var.vcenter_password
  insecure_connection = var.enable_insecure_con
  datacenter = var.vcenter_datacenter
  cluster = var.vcenter_cluster
  host = var.esx_host
  datastore = var.vcenter_datastore
  folder = var.vm_folder
  convert_to_template = var.enable_convert_template
  

  http_ip = var.http_ip
  http_directory = var.http_directory

  vm_name = var.vm_name
  vm_version = var.vm_version
  guest_os_type = var.os_type
  CPUs = var.vcpu_nums
  cpu_cores = var.vcpu_per_core
  CPU_hot_plug = var.cpu_hotadd
  RAM = var.memsize
  RAM_hot_plug = var.mem_hotadd
  video_ram = var.gpu_memsize

  firmware = var.boot_mode
  boot_wait = var.boot_wait
  boot_command = var.boot_command

  disk_controller_type = var.disk_controller
  network_adapters {
    network = var.network_adapter_config.network
    network_card = var.network_adapter_config.network_card
  }
 
  storage {
    disk_size = var.storage.disk_size
    disk_thin_provisioned = var.storage.disk_thin_provisioned
  }
 
  iso_urls = var.iso_urls
  iso_checksum = var.iso_checksum
  iso_paths = var.iso_path
  cdrom_type = var.cdrom_type
  cd_files = var.cd_files
  remove_cdrom = var.enable_cd_removal

  communicator = var.communicator_type
  winrm_username = var.os_user
  winrm_password = var.os_password
  winrm_port = var.remote_port
  winrm_insecure = var.winrm_insecure
  #ssh_clear_authorized_keys = true

  shutdown_command = var.shutdown_command
  shutdown_timeout = var.shutdown_timeout
  
  export {
    force            = var.export_config.force
    output_directory = var.export_config.output_directory
    options          = var.export_config.options
  }

}


build {
  name = "win2019"
  sources = ["source.vsphere-iso.win2019"]

  provisioner "powershell" {
    scripts = ["resources/scripts/win-update.ps1"]
    valid_exit_codes = [0,2300218]
  }

  provisioner "windows-restart" {
    pause_before = "30s"
    restart_timeout = "30m"
  }

  provisioner "powershell" {
    scripts = ["resources/scripts/win-update.ps1"]
  }

  provisioner "windows-restart" {
    restart_timeout = "30m"
  }

  provisioner "powershell" {
    scripts = ["resources/scripts/installdotnet48.ps1"]
  }

  provisioner "windows-restart" {
    restart_timeout = "30m"
  }

  provisioner "powershell" {
    scripts = ["resources/scripts/adjustments.ps1"]
  }

  provisioner "powershell" {
    scripts = ["resources/scripts/cleanup.ps1"]
  }

  provisioner "windows-restart" {
    restart_timeout = "30m"
  }

}
