function _Git_Commit_nv() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$Message = "update"
    )
    
    try {
        git commit -m "$($Message)" --no-verify

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Commit_nv): $($_.Exception.Message)" -ForegroundColor "Red"
        throw $_
    }
}

function _Git_Add_All() {
    try {
        git add --all

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Add_All): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Git_Commit_All () {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$Message = "update"
    )
    
    try {
        _Git_Add_All
        _Git_Commit_nv -Message $Message

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Commit_All): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Git_Push_All() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$Message = "update",
        [Parameter(Mandatory=$false)][switch]$Pull
    )

    try{
        if ($Pull) {
            git pull
        }

        _Git_Commit_All -Message $Message
        git push 

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Push_All): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Git_Switch_Branch() {
    param(
        [Parameter(Mandatory, Position=0, ValueFromPipeline)][string]$To
    )

    try {
        git switch $To

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Switch_Branch: $($To)): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Git_Merge() {
    param(
        [Parameter(Mandatory, Position=1, ValueFromPipeline)][string]$To,
        [Parameter(Mandatory, Position=0, ValueFromPipeline)][string]$Branch
    )

    try {
        _Git_Switch_Branch -To $Branch

        git fetch origin $To
        git merge $To
        git push origin "$($Branch):$($To)"

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Git_Merge: $($Branch) -> $($To))  $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _NPM_Serve() {
    try {
        npm run serve

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_NPM_Serve): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _NPM_Build() {
    try {
        npm run build

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_NPM_Build): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Build_WWW() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$ProjectPath = ".",
        [Parameter(Mandatory=$false, Position=1, ValueFromPipeline)][string]$CNAME = "loris.kampus.ch"
    )

    try {
        _NPM_Build

        if ($(Test-Path -Path "$($ProjectPath)\docs")) {
            Remove-Item -Path "$($ProjectPath)\docs" -Force -Recurse
        }

        Rename-Item -Path "$($ProjectPath)\dist" -NewName "docs"

        if (!$(Test-Path -Path "$($ProjectPath)\docs\CNAME")) {
            New-Item -Path "$($ProjectPath)\docs\CNAME" -Type File -Value $CNAME -Force
        }

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Build_WWW: $($ProjectPath)): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

function _Publish() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$Branch = "dev",
        [Parameter(Mandatory=$false, Position=1, ValueFromPipeline)][string]$WWWBranch = "master",
        [Parameter(Mandatory=$false, Position=2, ValueFromPipeline)][string]$ProjectPath = ".",
        [Parameter(Mandatory=$false, Position=3, ValueFromPipeline)][string]$CNAME = "loris.kampus.ch"
    )

    try {
        _Git_Switch_Branch -To $Branch
        _Build_WWW -CNAME $CNAME
        _Git_Push_All -Pull
        _Git_Merge -Branch $Branch -To $WWWBranch

        if(!$?) {
            throw "Error occured!"
        }
    }
    catch {
        Write-Host "[ERROR](_Publish_Dev): $($_.Exception.Message)"  -ForegroundColor "Red"
        throw $_
    }
}

Export-ModuleMember -Function * -Cmdlet * -Variable * -Alias *