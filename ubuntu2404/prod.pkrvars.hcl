vcenter_server          = "192.168.1.1"
vcenter_user            = "administrator@vsphere.local"
vcenter_password        = "$xxxxx"
enable_insecure_con     = true
vcenter_datacenter      = "Test-DC"
vcenter_cluster         = "Test-DC-CLUSTER"
vcenter_resource_pool   = null
esx_host                = "192.168.1.2"
vcenter_datastore       = "LocalStorage01"
vm_folder               = "TEST"
enable_convert_template = true
tools_upgrad_policy = true

http_ip                 = "172.16.1.1"
http_directory          = "./resources"
vm_name                 = "Ubuntu2404_template"
vm_version              = 18
os_type                 = "ubuntu-64"
vcpu_nums               = 4
vcpu_per_core           = 4
cpu_hotadd              = true
memsize                 = 8192
mem_hotadd              = true
gpu_memsize             = 8192
boot_mode               = "efi"
boot_wait               = "5s"
boot_command            = ["e<down><down><end>"," autoinstall ds=nocloud;","<F10>"]
disk_controller         = ["pvscsi"]

network_adapter_config = {
  network      = "NET-27"
  network_card = "vmxnet3"
}

storage = {
  disk_size             = 153600
  disk_controller_index = 0
  disk_eagerly_scrub    = false
  disk_thin_provisioned = true
}

iso_urls     = ["http://172.16.1.1:8000/ubuntu-24.04.2-live-server-amd64.iso"]
iso_checksum = "sha256:d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d"
iso_path     = ["[] /vmimages/tools-isoimages/windows.iso"]
cdrom_type   = "sata"
cd_files = [
  "resources/configs/meta-data",
  "resources/configs/user-data"
]
cd_label          = "cidata"
ip_wait_timeout   = "20m"
enable_cd_removal = true
communicator_type = "ssh"
os_user           = "Administrator"
os_password       = "$xxxxxxx"
remote_port       = 22
ssh_timeout = "30m"
ssh_handshake_attempts = "100"
shutdown_command  = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
shutdown_timeout  = "15m"

export_config = {
  force            = true
  output_directory = "./build"
  options          = ["nodevicesubtypes"]
}

shell_scripts = ["resources/configs/setup.sh]
