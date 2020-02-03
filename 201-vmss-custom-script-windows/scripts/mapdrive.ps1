$connectTestResult = Test-NetConnection -ComputerName lzhasa1.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"lzhasa1.file.core.windows.net`" /user:`"Azure\lzhasa1`" /pass:`"T04ZWKbET1Zy/Xgz75U8bqBsaRiXqulHrotTXZd4jXGMwYuNUqpjrWLBi0uc62aVqMWxznDsZR+BKw5nOA1WCw==`""
    # Mount the drive
    New-PSDrive -Name P -PSProvider FileSystem -Root "\\lzhasa1.file.core.windows.net\share1"-Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}