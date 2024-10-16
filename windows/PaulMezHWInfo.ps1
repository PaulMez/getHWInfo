# Define the output file path
$outputFile = "C:\PaulMezHWInfo.txt"

# Gather System Information
$systemInfo = Get-ComputerInfo

# Gather CPU Information
$cpuInfo = Get-WmiObject Win32_Processor

# Gather Memory Information
$memoryInfo = Get-WmiObject Win32_PhysicalMemory

# Gather Disk Information
$diskInfo = Get-WmiObject Win32_DiskDrive

# Gather Network Adapter Information
$networkInfo = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }

# Gather GPU Information
$gpuInfo = Get-WmiObject Win32_VideoController

# Gather BIOS Information
$biosInfo = Get-WmiObject Win32_BIOS

# Gather Motherboard Information
$motherboardInfo = Get-WmiObject Win32_BaseBoard

# Write all information to the output file
Add-Content -Path $outputFile -Value "System Information:"
Add-Content -Path $outputFile -Value $systemInfo

Add-Content -Path $outputFile -Value "`nCPU Information:"
$cpuInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nMemory Information:"
$memoryInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nDisk Information:"
$diskInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nNetwork Adapter Information:"
$networkInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nGPU Information:"
$gpuInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nBIOS Information:"
$biosInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

Add-Content -Path $outputFile -Value "`nMotherboard Information:"
$motherboardInfo | ForEach-Object { Add-Content -Path $outputFile -Value $_ }

# Notify completion
Write-Host "Hardware information has been saved to $outputFile"
