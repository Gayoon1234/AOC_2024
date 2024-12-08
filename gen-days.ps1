for ($i = 1; $i -le 25; $i++) {
    New-Item -Path "$i\code" -ItemType Directory -Force
    New-Item -Path "$i\input" -ItemType Directory -Force
}

Write-Host "Folders created successfully."
