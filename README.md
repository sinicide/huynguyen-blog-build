# huynguyen-blog-build

This is the repo for huynguyen.me, my personal blog.

## Make Dockerfile

Used to stand up local development server (please note it defaults to dev environment, set `HUGO_BUILD_ENVIRONMENT=production` to deploy production), otherwise dev is deployed by default.

```
make build
docker-compose up -d
```

## Tear down

Stopping the local development server

```
docker-compose down
```

## For Production

Include Environment Variables

```
env HUGO_googleAnalytics="XXXXXX"
```

