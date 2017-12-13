# Sync files
aws s3 sync . s3://austinfpv.racing \
    --exclude="*.git*" \
    --exclude="*.DS_Store" \
    --exclude="deploy.sh" \
    --exclude="*.less"

# Invalidate cache
aws cloudfront create-invalidation --distribution-id E248HUNS5N052F --paths /index.html /css/*
