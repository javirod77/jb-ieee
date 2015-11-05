echo "Building

"
jekyll build

# chmod 775 _site/assets/images/post_imgs/*
# chmod 775 _site/assets/images/post_imgs/*

echo "

Deploying

"
# scp -r _site/* user@example.com:/path/to/root/site/
scp -r _site/* ieee@ieee.gatech.edu:/httpsdocs
