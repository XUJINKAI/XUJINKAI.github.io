build:
	bundle exec jekyll build --trace --config _config.yml

serve:
	bundle exec jekyll serve -H 0.0.0.0 -P 4000 --trace --watch --config _config.yml

c: clean
clean:
	-rm -rf _site
	-rm -rf .jekyll-cache

.PHONY: build serve c clean
