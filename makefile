.PHONY: resume render serve build deploy rsync

deploy: rsync
	s3cmd sync site/ s3://midi-controller --acl-public

rsync:
	mkdir -p site
	rsync -Rr \
		index.html css js \
		vendor/jquery/dist/jquery.js \
		site
