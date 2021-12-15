## Change to your favorite Nerd Font and Oh-My-Posh theme ##
$reserved_font_name = "cascadiacode-nf"
$omp_theme = "tonybaloney"

# Install scoop (package manager)
Write-Output "Preparing to install Scoop..."
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Scoop..."
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
} else {
    Write-Output "Scoop already installed!"
}

# Install Nerd Fonts
Write-Output "Preparing to install Nerd Fonts..."
scoop install sudo
scoop bucket add nerd-fonts
sudo scoop install $reserved_font_name
sudo scoop update $reserved_font_name

# Install Oh-My-Posh
Write-Output "Preparing to install Oh-My-Posh..."
Install-Module oh-my-posh -Scope CurrentUser
Update-Module oh-my-posh
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
scoop update oh-my-posh

# Install Windows Terminal
Write-Output "Preparing to install Windows Terminal..."
$OS = (Get-WmiObject -class Win32_OperatingSystem).Caption
if (($OS | Select-String "Windows 10" -Quiet) -or ($OS | Select-String "Windows 11" -Quiet)) {
    Write-Output "Installing Windows Terminal..."
    scoop bucket add extras
    scoop install windows-terminal
    scoop update windows-terminal
} else {
    Write-Output "Couldn't install: Windows Terminal only works on Windows 10 & 11"
}

# Apply theme for Oh-My-Posh
Set-Content $PROFILE "Set-PoshPrompt -Theme $omp_theme"