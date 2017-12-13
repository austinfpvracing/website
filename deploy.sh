aws s3 sync . s3://austinfpv.racing \
    --exclude="*.git*" \
    --exclude="*.DS_Store" \
    --exclude="deploy.sh" \
    --exclude="*.less"