Import-Module -Name ".\.dev-tools\.lib\utils.psm1"

try{
    _Publish -Branch "dev" -WWWBranch "master" -CNAME "loris.kampus.ch"
}
catch {
    throw $_.Exception.Message
}