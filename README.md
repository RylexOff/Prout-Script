# Prout Script
![alt text](https://github.com/RylexOff/Prout-Script/blob/main/Prout-Script.gif?raw=true)

## Table of contents

- [Description](#description)
- [Getting Started](#getting-started)
  - [Dependencies](#dependencies)
  - [Execution](#execution)
- [Code Explanation](#code-explanation)
  - [BashBunny Script](#bashbunny-script)
  - [PowerShell Script](#powershell-script)
- [Contributing](#contributing)
- [Version History](#version-history)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)


## Description


It's a prank script designed to make your friend laugh who doesn't lock their computer. it must be run on a Windows 10 or 11 system, it does:
-Increase the volume to the maximum
-Download the video
-Launch the video in a loop (30 times max).


This script must be used as is, nothing to modify. The chosen video is a fart of Shrek, because we appreciate humor. That's why it's called the "prout-script".
ps: "Prout" = "Fart" in French

## Getting Started

### Dependencies

- Windows 10, 11
- Internet connection

### Execution

1. Plug in your bash bunny.
2. Modify the code to specify your preferred browser and video link.
3. The script will automatically execute, raising the volume to the maximum and opening the specified webpage or video.

Or

1. Windows + R
2. Past " powershell -NoP -NonI -WindowStyle Hidden -Exec Bypass "(iwr -UseBasicParsing https://raw.githubusercontent.com/RylexOff/Prout-Script/main/prout_script.ps1).Content | iex" "
3. Press Enter
   
## Code explanation

### BashBunny Script
This line of code directly executes the script content from the specified URL using Invoke-WebRequest.
```
powershell -NoP -NonI -WindowStyle Hidden -Exec Bypass "(iwr -UseBasicParsing https://raw.githubusercontent.com/RylexOff/Prout-Script/main/prout_script.ps1).Content | iex"
```
### Powershell Script

These lines increase the system volume by simulating pressing the "[char]0xAF" key which is the volume up key
```
$volume = New-Object -ComObject "WScript.Shell"
$volumeLevel = 100
for ($i = 0; $i -le $volumeLevel; $i++) {
    $volume.SendKeys([char]175)
}
```

Set the download path in a variable
```
$downloadPath = "$env:USERPROFILE\Downloads" 
```

Download the video of shrek who farts. You can modify the url to put another video certainly funnier ='(
```
(New-Object System.Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/937329842859421706/1130437612985909298/Bruit_de_pet_qui_resonne.mp4', $downloadPath + '\shrek_Farts.mp4') 
```

Get the path of the last downloaded file
```
$videoPath = $(Get-ChildItem -Path $env:USERPROFILE\Downloads | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1).FullName
```

Open default media player
```
$shell = New-Object -ComObject Shell.Application
```

Will restart the video 30 times
```
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
```
## Contributing

Contributors:
- RylexOff

## Version History

- 1.0: Initial Release

## Contact

- GitHub: [RylexOff](https://github.com/RylexOff)

## Acknowledgments

- [Hak5](https://hak5.org/)
- [I-Am-Jakoby](https://github.com/I-Am-Jakoby)
