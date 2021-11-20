## Change to your favorite Nerd Font and Oh-My-Posh theme ##
$nerd_font = "CaskaydiaCove NF"
$reserved_font_name = "cascadiacode-nf"
$omp_theme = "tonybaloney"

# Install scoop (package manager)
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

# Install Nerd Fonts
scoop bucket add nerd-fonts
scoop install $reserved_font_name

# Install Oh-My-Posh
Install-Module oh-my-posh -Scope CurrentUser

# Install Windows Terminal
scoop bucket add extras
scoop install windows-terminal

# Apply nerd font to Windows Terminal settings
$p = "$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$f = (Get-Content $p -raw | ConvertFrom-Json)
$f.profiles.list[0].fontFace = $nerd_font
$f | ConvertTo-Json -depth 69 | Set-Content $p

# Apply theme for Oh-My-Posh
Set-Content $PROFILE "Set-PoshPrompt -Theme $omp_theme"