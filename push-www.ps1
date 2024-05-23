try{
    npm run build

    if ($(Test-Path -Path ".\docs")) {
        Remove-Item -Path ".\docs" -Force -Recurse
    }

    New-Item -Path ".\docs\css" -Type Directory
    
    Get-ChildItem -Path ".\dist" | %{Copy-Item -Path $_.FullName -Destination ".\docs" -Recurse -Force}

    if (!$(Test-Path -Path ".\docs\CNAME")) {
        New-Item -Path ".\docs\CNAME" -Type File -Value "loris.kampus.ch" -Force
    }

    git add --all; git commit -m "push-www" --no-verify; git push
}
catch {
    throw $_.Exception.Message
}
