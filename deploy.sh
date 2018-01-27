# Compile less
lessc css/main.less public/css/main.css

# Move html (nothing to compile yet)
cp index.html public/index.html 

# Sync files
aws s3 sync public s3://austinfpv.racing \
    --exclude="*.git*" \
    --exclude="*.DS_Store" \
    --exclude="deploy.sh" \
    --exclude="*.less"

# Invalidate cache
aws cloudfront create-invalidation --distribution-id E248HUNS5N052F --paths / /index.html /css/*
