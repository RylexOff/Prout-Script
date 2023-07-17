$volume = New-Object -ComObject "WScript.Shell"
$volumeLevel = 100
for ($i = 0; $i -le $volumeLevel; $i++) {
    $volume.SendKeys([char]175)
}
$downloadPath = "$env:USERPROFILE\Downloads" 
(New-Object System.Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/937329842859421706/1130437612985909298/Bruit_de_pet_qui_resonne.mp4', $downloadPath + '\Bruit_de_pet_qui_resonne.mp4')
$videoPath = $(Get-ChildItem -Path $env:USERPROFILE\Downloads | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1).FullName
$shell = New-Object -ComObject Shell.Application
$shell.ShellExecute($videoPath)
clear
exit

