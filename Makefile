deploy:
	aws s3 rm s3://brittanyrebarchikcom --exclude "*" --include ".*" --include "Makefile" --recursive
	aws s3 sync ./ s3://brittanyrebarchikcom --acl public-read --delete --exclude ".*"
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id ETYZRVYEZ0Z8P --paths '/*'
