Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask -Verbose

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y adobereader
choco install -y googlechrome

# Install Fonts
# cd $env:TEMP
# curl.exe -Lo add-font.ps1 https://raw.githubusercontent.com/blackcodesun/powershell-add-font/master/add-font.ps1
# mkdir waldo
# cd waldo
# curl.exe -Lo WALDO3.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO3.TTF
# curl.exe -Lo WALDO4.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO4.TTF
# curl.exe -Lo WALDO5.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO5.TTF
# curl.exe -Lo WALDO6.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO6.TTF
# curl.exe -Lo WALDO7.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO7.TTF
# ../add-font.ps1 *.TTF

# Install nextcloud client 2.5.2
curl.exe -Lo $env:TEMP/Nextcloud-setup.exe https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.5.2-setup.exe
Start-Process $env:TEMP/Nextcloud-setup.exe -ArgumentList '/S' -NoNewWindow -Wait
$env:TEMP/Nextcloud-setup.exe 

# Install Scribus 1.5.4
curl.exe -Lo $env:TEMP/scribus-setup.exe https://sourceforge.net/projects/scribus/files/scribus-devel/1.5.4/scribus-1.5.4-windows-x64.exe/download
Start-Process $env:TEMP/scribus-setup.exe -ArgumentList '/S' -NoNewWindow -Wait
Remove-Item $env:TEMP/scribus-setup.exe

# set timezone to Berlin
Write-Host "Set Timezone to Berlin..."
& tzutil /s "W. Europe Standard Time"

$GermanXml = @"
<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">

<gs:UserList>
<gs:User UserID="Current" CopySettingsToSystemAcct="true" />
</gs:UserList>

<gs:UserLocale>
<gs:Locale Name="de-DE" SetAsCurrent="true"/>
</gs:UserLocale>

<gs:InputPreferences>
<gs:InputLanguageID Action="add" ID="0409:00000409"/>
<gs:InputLanguageID Action="add" ID="0407:00000407" Default="true"/>
</gs:InputPreferences>

<gs:LocationPreferences>
<gs:GeoID Value="94"/>
</gs:LocationPreferences>

</gs:GlobalizationServices>
"@
Write-Host "Set Language and Keyboard to German..."
$FileName = "$env:TEMP\\german.xml"
$GermanXml | Out-File -FilePath $FileName

& control.exe "intl.cpl,,/f:`"$FileName`""
