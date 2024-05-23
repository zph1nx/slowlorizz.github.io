try{
    npm run build

    if ($(Test-Path -Path ".\docs")) {
        Remove-Item -Path ".\docs" -Force -Recurse
    }

    Rename-Item -Path ".\dist" -NewName "docs"

    if (!$(Test-Path -Path ".\docs\CNAME")) {
        New-Item -Path ".\docs\CNAME" -Type File -Value "loris.kampus.ch" -Force
    }

    git pull
    git add --all; git commit -m "push-www" --no-verify; git push
}
catch {
    throw $_.Exception.Message
}
