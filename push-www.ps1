try{
    git pull
    npm run build
    git add --all
    git commit -m "new dist"
    git subtree push --prefix dist origin www 
}
catch {
    throw $_.Exception.Message
}
