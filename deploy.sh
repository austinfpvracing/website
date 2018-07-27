# Create directory for deployment
mkdir -p public

# Compile less
lessc css/main.less public/css/main.css

# Move html, img, js
cp index.html public/index.html 
cp -R img public
cp -R js public

# Sync files
aws s3 sync public s3://austinfpv.racing \
    --exclude="*.git*" \
    --exclude="*.DS_Store" \
    --exclude="deploy.sh" \
    --exclude="*.less"

# Invalidate cache
aws cloudfront create-invalidation --distribution-id E248HUNS5N052F --paths / /index.html /css/*

# Delete build directory
rm -rf public