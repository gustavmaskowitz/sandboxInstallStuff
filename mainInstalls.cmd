REM Download the Spotify installer to the temp folder in the Sandbox
curl -L "https://download.spotify.com/SpotifySetup.exe" --output C:\temp\SpotifySetup.exe

REM Download Visual Studio Code User Installer to the temp folder in the Sandbox
curl -L "https://update.code.visualstudio.com/latest/win32-x64-user/stable" --output C:\temp\vscode_installer.exe

REM Install Visual Studio Code silently and suppress message boxes
C:\temp\vscode_installer.exe /verysilent /suppressmsgboxes

REM Install Spotify silently
C:\temp\SpotifySetup.exe /Silent

REM Spotify installs to the current user's AppData\Roaming directory (WDAGUtilityAccount)
start "" "C:\Users\WDAGUtilityAccount\AppData\Roaming\Spotify\Spotify.exe"

REM Run Visual Studio Code after installation
"C:\Users\WDAGUtilityAccount\AppData\Local\Programs\Microsoft VS Code\Code.exe"
