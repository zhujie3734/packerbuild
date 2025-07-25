# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y googlechrome --ignore-checksums

choco install -y powershell-core

choco install -y 7zip

choco install -y notepadplusplus.install

#choco install -y --package-parameters=/SSHServerFeature openssh

