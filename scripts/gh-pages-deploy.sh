echo "Starting new deployment..."
git checkout --orphan gh-pages
echo "Building..."
npm run build
git --work-tree dist add --all
echo "Commiting new changes..."
git --work-tree dist commit -m 'Deploy'
echo "Pushing to gh-pages..."
git push origin HEAD:gh-pages --force
rm -r dist
git checkout -f main
git branch -D gh-pages
echo "Successfully deployed!"
