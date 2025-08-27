# example.pkrvars.hcl

vcenter_server         = "192.168.1.1"
vcenter_user           = "administrator@vsphere.local"
vcenter_password       = "XXXXXX"
enable_insecure_con    = true
vcenter_datacenter     = "DC-test"
vcenter_cluster        = "DC-test-CLUSTER"
vcenter_resource_pool  = null
esx_host               = "192.168.1.2"
vcenter_datastore      = "LocalStorage01"
vm_folder              = "Test"
enable_convert_template = true
http_ip                = "172.16.1.1"
http_directory         = "./resources"
vm_name                = "WindowsServer2019_template"
vm_version             = 18
os_type                = "windows2019srv_64Guest"
vcpu_nums              = 4
vcpu_per_core          = 4
cpu_hotadd             = true
memsize                = 8192
mem_hotadd             = true
gpu_memsize            = 8192
boot_mode              = "efi-secure"
boot_wait              = "3s"
boot_command           = ["w"]
disk_controller        = ["pvscsi"]

network_adapter_config = {
  network      = "Net-27"
  network_card = "vmxnet3"
}

storage = {
  disk_size             = 153600
  disk_thin_provisioned = true
}

iso_urls     = ["http://172.16.1.1:8000/SERVER_2019_x64.ISO"]
iso_checksum = "sha256:e80947cea3be3e2063db822e24c90a43402b37d1d9a6a744b891ad21fbf44acb"
iso_path     = ["[] /vmimages/tools-isoimages/windows.iso"]
cdrom_type   = "sata"
cd_files = [
  "resources/configs/autounattend.xml",
  "resources/configs/sysprep-autounattend.xml",
  "resources/scripts/install-vmware-tools-from-iso.ps1"
]
enable_cd_removal   = true
communicator_type   = "winrm"
os_user             = "Administrator"
os_password         = "XXXXXX"
remote_port         = 5985
winrm_insecure      = true
shutdown_command    = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /shutdown /unattend:F:\\sysprep-autounattend.xml"
shutdown_timeout    = "60m"

export_config = {
  force            = true
  output_directory = "./build"
  options          = ["nodevicesubtypes"]
}
