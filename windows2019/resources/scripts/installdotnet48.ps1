$dotnet47URL = "https://go.microsoft.com/fwlink/?linkid=863265"
$dotnet48URL = "https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe"

$installerPath47 = "$env:TEMP\NDP472-KB4054530-x86-x64-ALLOS-ENU.exe"
$installerPath48 = "$env:TEMP\NDP48-x86-x64-ALLOS-ENU.exe"

Invoke-WebRequest -Uri $dotnet47URL -OutFile $installerPath47
Invoke-WebRequest -Uri $dotnet48URL -OutFile $installerPath48

Start-Process -FilePath $installerPath47 -ArgumentList "/quiet", "/norestart" -Wait
Start-Process -FilePath $installerPath48 -ArgumentList "/quiet", "/norestart" -Wait

$reg = "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"
if (!(Test-Path $reg) -or ((Get-ItemProperty $reg).Release -lt 528040)) {
  Write-Host "Rebooting to finalize .NET installation..."
}
