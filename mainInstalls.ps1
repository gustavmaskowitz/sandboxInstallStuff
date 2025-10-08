# Define variables for cleaner code
$SpotifyUri = "https://download.spotify.com/SpotifySetup.exe"
$VSCodeUri = "https://update.code.visualstudio.com/latest/win32-x64-user/stable"
$TempPath = "C:\temp"
$SpotifySetup = "$TempPath\SpotifySetup.exe"
$VSCodeSetup = "$TempPath\vscode_installer.exe"
$Username = "WDAGUtilityAccount" # Note: This user only exists inside WSB
$SpotifyExe = "C:\Users\$Username\AppData\Roaming\Spotify\Spotify.exe"
$VSCodeExe = "C:\Users\$Username\AppData\Local\Programs\Microsoft VS Code\Code.exe"

# Create Temp directory if it doesn't exist (equivalent to making it safe to download)
New-Item -Path $TempPath -ItemType Directory -Force | Out-Null;

# Download Spotify Installer
Invoke-WebRequest -Uri $SpotifyUri -OutFile $SpotifySetup;

# Install Spotify silently and wait for completion
Start-Process -FilePath $SpotifySetup -ArgumentList "/Silent" -Wait -NoNewWindow;

# Download VS Code Installer
Invoke-WebRequest -Uri $VSCodeUri -OutFile $VSCodeSetup;

# Install Visual Studio Code silently and wait for completion
Start-Process -FilePath $VSCodeSetup -ArgumentList "/VERYSILENT", "/SUPPRESSMSGBOXES" -Wait -NoNewWindow;

# Run Spotify after installation
Start-Process -FilePath $SpotifyExe;

# Run Visual Studio Code after installation
Start-Process -FilePath $VSCodeExe
