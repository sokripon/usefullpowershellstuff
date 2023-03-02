# Personal customisation
# Invoke-Expression (&starship init powershell)
# For zoxide v0.8.0+
# Invoke-Expression (& {
#         $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
#     (zoxide init --hook $hook powershell | Out-String)
#     })


# For Tabcompletion
# Import-Module PSReadLine
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# Set-PSReadLineOption -PredictionViewStyle ListView


# For python aliases
# Set-Alias -Name "python36" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python36\python.exe"
# Set-Alias -Name "python37" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python37\python.exe"
# Set-Alias -Name "python38" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python38\python.exe"
# Set-Alias -Name "python39" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python39\python.exe"
# Set-Alias -Name "python310" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python310\python.exe"
# Set-Alias -Name "python311" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python311\python.exe"
# Set-Alias -Name "python312" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python312\python.exe"

# Alternative way:
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python36\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python36\python36.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python37\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python37\python37.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python38\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python38\python38.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python39\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python39\python39.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python310\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python310\python310.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python311\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python311\python311.exe"
# New-Item -ItemType HardLink -Target "C:\Users\Raphael\AppData\Local\Programs\Python\Python312\python.exe" -Path "C:\Users\Raphael\AppData\Local\Programs\Python\Python312\python312.exe"


# For java aliases
# Set-Alias -Name "java8" -Value "C:\Program Files\Java\jdk1.8.0_181\bin\java.exe"
# Set-Alias -Name "java8c" -Value "C:\Program Files\Java\jdk1.8.0_181\bin\javac.exe"
# Set-Alias -Name "java18" -Value "C:\Program Files\Eclipse Adoptium\jdk-18.0.1.10-hotspot\bin\java.exe"
# Set-Alias -Name "java18c" -Value "C:\Program Files\Eclipse Adoptium\jdk-18.0.1.10-hotspot\bin\javac.exe"


# Jypiter Labs aliases
# Set-Alias -Name "jp" -Value "C:\Users\Raphael\AppData\Local\Programs\Python\Python310\Scripts\jupyter.exe"
# function jpl {
#     jp lab
# }