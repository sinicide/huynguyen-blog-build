#!/bin/sh

# Hugo Live Server
#env HUGO_googleAnalytics="hello_world" \
/bin/hugo server --watch \
    --buildDrafts \
    --disableFastRender \
    --noHTTPCache \
    --ignoreCache \
    --bind 0.0.0.0 \
    --port $HUGO_PORT \
    --environment $HUGO_BUILD_ENVIRONMENT \
    --source $HUGO_BUILD_SRC \
    --cleanDestinationDir \
    --destination $HUGO_BUILD_DEST \
    --gc