packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vsphere = {
      version = ">= 1.0.0"
      source = "github.com/hashicorp/vsphere"
    }
  }
}

locals {
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
}

source "vsphere-iso" "linux-ubuntu-server" {
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
  toos_upgrade_policy = var.vmtools_upgrade
  notes = "Built by Packer on ${local.buildtime}." 

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
  boot_order = "disk,cdrom"
  boot_wait = var.boot_wait
  boot_command = var.boot_command

  disk_controller_type = var.disk_controller
  network_adapters {
    network = var.network_adapter_config.network
    network_card = var.network_adapter_config.network_card
  }
 
  storage {
    disk_size = var.storage.disk_size
    disk_controller_index = var.disk_controller_index
    disk_thin_provisioned = var.storage.disk_thin_provisioned
    disk_eagerly_scrub = var.disk_eagerly_scrub
  }
 
  iso_urls = var.iso_urls
  iso_checksum = var.iso_checksum
 # iso_paths = var.iso_path
  cdrom_type = var.cdrom_type
  cd_files = var.cd_files
  remove_cdrom = var.enable_cd_removal
  cd_label = var.cd_label
  ip_wait_timeout = var.ip_wait_timeout

  communicator = var.communicator_type
  ssh_username = var.ssh_user
  ssh_password = var.ssh_password
  ssh_port = var.remote_port
  ssh_timeout = var.ssh_timeout
  ssh_handshake_attempts = var.ssh_handshake_attempts
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
  name = "linux-ubuntu-server"
  sources = ["source.vsphere-iso.linux-ubuntu-server"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.ssh_username}",
    ]
    scripts = var.shell_scripts
    expect_disconnect = true
  }
}
