iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y scribus
choco install -y adobereader

# Install Fonts
cd $env:TEMP
curl.exe -Lo add-font.ps1 https://raw.githubusercontent.com/blackcodesun/powershell-add-font/master/add-font.ps1
mkdir waldo
cd waldo
curl.exe -Lo WALDO3.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO3.TTF
curl.exe -Lo WALDO4.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO4.TTF
curl.exe -Lo WALDO5.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO5.TTF
curl.exe -Lo WALDO6.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO6.TTF
curl.exe -Lo WALDO7.TTF https://github.com/veitgroesch/Texel/raw/master/Schriften/WALDO7.TTF
../add-font.ps1 *.TTF

# Install nextcloud client
curl.exe -Lo $env:TEMP/Nextcloud-2.5.2-setup.exe https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.5.2-setup.exe
Start-Process $env:TEMP/Nextcloud-2.5.2-setup.exe -ArgumentList '/S' -NoNewWindow -Wait
