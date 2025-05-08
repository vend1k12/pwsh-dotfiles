#-----------------------------------------------------
# WINDOW TITLE
#-----------------------------------------------------
$Host.UI.RawUI.WindowTitle = "PowerShell"

#-----------------------------------------------------
# CONSTANTS
#-----------------------------------------------------
$theme = 'catppuccin_macchiato.omp.json'
$ohMyPosh = "C:\Users\vendy\AppData\Local\Programs\oh-my-posh\themes\$theme"

#-----------------------------------------------------
# THEME
#-----------------------------------------------------
oh-my-posh init pwsh --config $ohMyPosh | Invoke-Expression # init oh-my-posh with theme
Import-Module -Name Terminal-Icons # init icons

#-----------------------------------------------------
# AUTOCOMPLETE
#-----------------------------------------------------
Import-Module PSReadLine

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

#-----------------------------------------------------
# FUNCTIONS (Aliases with arguments)
#-----------------------------------------------------
function l { eza -lh --icons=auto } # long list
function ls { eza -1 --icons=auto } # short list
function ll { eza -lha --icons=auto --sort=name --group-directories-first } # long list all
function ld { eza -lhD --icons=auto }  # long list dirs
function lt { eza --icons=auto --tree }  # list folder as tree

#-----------------------------------------------------
# ALIASES
#-----------------------------------------------------
Set-Alias -Name p -Value pnpm # run pnpm
Set-Alias -Name g -Value git # run git
Set-Alias -Name y -Value yarn # run yarn
Set-Alias -Name c -Value clear # clear terminal 
Set-Alias -Name vc -Value code # run vscode

#-----------------------------------------------------
# FUNCTIONS (Additional)
#-----------------------------------------------------
krabby random --no-title # showing random pokemon on startup pwsh

#-----------------------------------------------------
# INITIALIZATION
#-----------------------------------------------------
Invoke-Expression (& { (zoxide init powershell | Out-String) }) # init pwsh with zoxide
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
