param (
    [Parameter()][switch]$start,
    [Parameter()][switch]$stop,
    [Parameter()][switch]$restart,
    [Parameter()][switch]$status,
    [Parameter()][string]$DevEnvDir = './.dev_env',
    [Parameter()][string]$ComposeFile = 'docker-compose.yml',
    [Parameter()][string]$ConfigFile = 'config.env',
    [Parameter()][switch]$dit = $true
)

function Get-ContainerName(){
    return $(Get-Content -Path "$($DevEnvDir)/$($ConfigFile)" | ?{$_ -match '^CONTAINER_NAME\=.*$'} | %{$_.Split('=')[1].Replace('"', '')})
}

function Start-DevEnv {
    if(!$dit){
        docker-compose -f "$($DevEnvDir)/$($ComposeFile)" --env-file "$($DevEnvDir)/$($ConfigFile)" up
    }
    else {
        docker-compose -f "$($DevEnvDir)/$($ComposeFile)" --env-file "$($DevEnvDir)/$($ConfigFile)" up -d
    }
}

function Stop-DevEnv {
    $cn = $(Get-ContainerName)
    docker stop $cn
    docker rm $cn
}

function Restart-DevEnv {
    Stop-DevEnv
    Start-Sleep -Seconds 1
    Start-DevEnv
}

function Get-ContainerStatus {
    [string[]]$v = docker ps -a | ?{$_ -match ".*$(Get-ContainerName).*"} | %{$_.Split('   ')}

    [hashtable]$stats = @{
        ID = $v[0]
        IMAGE = $v[1]
        COMMAND = $v[2]
        CREATED = $v[3]
        STATUS = $v[4]
        PORTS = $v[5]
        NAMES = $v[6]
    }

    return $stats
}

function Write-ContainerStatus {
    $s = Get-ContainerStatus

    Write-Host "$($s.NAMES) | " -NoNewline

    if ("$($s.STATUS)" -match '.*Up.*'){
        Write-Host " UP " -ForegroundColor 'Black' -BackgroundColor 'Green' -NoNewline
    }
    else {
        Write-Host " DOWN " -ForegroundColor 'Black' -BackgroundColor 'Red' -NoNewline
    }

    Write-Host " | $($s.PORTS) | $($s.IMAGE)"
}

if($start){
    Start-DevEnv
}
elseif ($stop) {
    Stop-DevEnv
}
elseif ($restart) {
    Restart-DevEnv
}
elseif ($status) {
    Write-ContainerStatus
}
else {
    Write-Warning "No Action submitted -> doing nothing!!"
}

