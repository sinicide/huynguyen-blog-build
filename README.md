# huynguyen-blog-build
This is the repo for huynguyen.me, my personal blog.

## Running a local deployment
```
hugo server -D --bind <IP_ADDRESS> --baseURL=http://<IP_ADDRESS>
```

## Testing docker build
```
make build
docker-compose up -d
```

## Tear down
```
docker-compose down
make clean
```

## For Production
```
env HUGO_googleAnalytics="XXXXXX"
```

## Creating a new Blog Post
```
cd src
hugo new content/blog/<year>/<month>/<title>/index.md
```