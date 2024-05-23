try{
    git pull
    npm run build
    git add --all
    git commit -m "new dist"
    git push
    git subtree push --prefix dist origin www 
}
catch {
    throw $_.Exception.Message
}
