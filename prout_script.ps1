#Increase the system volume by simulating pressing a volume up key
$volume = New-Object -ComObject "WScript.Shell"
$volumeLevel = 100
for ($i = 0; $i -le $volumeLevel; $i++) {
    $volume.SendKeys([char]175)
}

#Set the download path in a variable
$downloadPath = "$env:USERPROFILE\Downloads" 
#Download the video of shrek who farts
(New-Object System.Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/937329842859421706/1130437612985909298/Bruit_de_pet_qui_resonne.mp4', $downloadPath + '\shrek_Farts.mp4')
#Get the path of the last downloaded file
$videoPath = $(Get-ChildItem -Path $env:USERPROFILE\Downloads | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1).FullName
#Open default media player
$shell = New-Object -ComObject Shell.Application
#Va relancer la video 30 fois
for ($i = 1; $i -le 30; $i++) {
    $shell.ShellExecute($videoPath)
    Start-Sleep -Milliseconds 4000
    $shellWindows = $shell.Windows()
    foreach ($window in $shellWindows) {
        if ($window.Document.Title -like "*shrek_Farts*") {
            $window.Quit()
        }
    }
}
#clear terminal and quit
clear
exit

