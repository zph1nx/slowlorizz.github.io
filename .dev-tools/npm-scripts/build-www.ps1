Import-Module -Name ".\.dev-tools\.lib\utils.psm1"

try{
    _Build_WWW -CNAME "loris.kampus.ch"
}
catch {
    throw $_.Exception.Message
}
