function _Git_Commit_nv() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$Message = "update"
    )
    
    try {
        git commit -m "$($Message)" --no-verify
    }
    catch {
        Write-Host "[ERROR](_Git_Commit_nv): $($_.Exception.Message)"
        throw $_
    }
}

function _Git_Add_All() {
    try {
        git add --all
    }
    catch {
        Write-Host "[ERROR](_Git_Add_All): $($_.Exception.Message)"
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
    }
    catch {
        Write-Host "[ERROR](_Git_Commit_All): $($_.Exception.Message)"
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
    }
    catch {
        Write-Host "[ERROR](_Git_Push_All): $($_.Exception.Message)"
        throw $_
    }
}

function _Git_Switch_Branch() {
    param(
        [Parameter(Mandatory, Position=0, ValueFromPipeline)][string]$To
    )

    try {
        git switch $To
    }
    catch {
        Write-Host "[ERROR](_Git_Switch_Branch: $($To)): $($_.Exception.Message)"
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
    }
    catch {
        Write-Host "[ERROR](_Git_Merge: $($Branch) -> $($To))  $($_.Exception.Message)"
        throw $_
    }
}

function _NPM_Serve() {
    try {
        npm run serve
    }
    catch {
        Write-Host "[ERROR](_NPM_Serve): $($_.Exception.Message)"
        throw $_
    }
}

function _NPM_Build() {
    try {
        npm run build
    }
    catch {
        Write-Host "[ERROR](_NPM_Build): $($_.Exception.Message)"
        throw $_
    }
}

function _Build_WWW() {
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromPipeline)][string]$ProjectPath = ".",
        [Parameter(Mandatory=$false, Position=1, ValueFromPipeline)][string]$CNAME = "loris.kampus.ch"
    )

    [string]$Docs_Path = "$($ProjectPath)\docs"
    [string]$Dist_Path = "$($ProjectPath)\dist"
    [string]$CNAME_Path = "$($Docs_Path)\CNAME"

    try {
        _NPM_Build

        if ($(Test-Path -Path $Docs_Path)) {
            Remove-Item -Path $Docs_Path -Force -Recurse
        }

        Rename-Item -Path $Dist_Path -NewName "docs"

        if (!$(Test-Path -Path $CNAME_Path)) {
            New-Item -Path $CNAME_Path -Type File -Value $CNAME -Force
        }
    }
    catch {
        Write-Host "[ERROR](_Build_WWW: $($ProjectPath)): $($_.Exception.Message)"
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
        _Build_WWW -ProjectPath $ProjectPath -CNAME $CNAME
        _Git_Push_All -Pull
        _Git_Merge -Branch $Branch -To $WWWBranch
        _Git_Switch_Branch -To $Branch
        _Git_Push_All -Pull
    }
    catch {
        Write-Host "[ERROR](_Publish_Dev): $($_.Exception.Message)"
        throw $_
    }
}

Export-ModuleMember -Function * -Cmdlet * -Variable * -Alias *