build:
	docker build --no-cache -t huynguyen-blog-build:1.1 .
clean:
	rm -rf "public"
gitupdate:
	git pull --recurse-submodules
