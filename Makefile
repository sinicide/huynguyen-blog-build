build:
	docker build --no-cache -t huynguyen-blog-build:1.0 .
clean:
	rm -rf "public"