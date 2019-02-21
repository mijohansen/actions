FROM alpine:latest

LABEL "name"="autotag"
LABEL "maintainer"="Michael Johansen <no-reply@github.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="AutoTag for GitHub Actions"
LABEL "com.github.actions.description"="This action will just create a new version in its repository."
LABEL "com.github.actions.icon"="tag"
LABEL "com.github.actions.color"="orange"
RUN apk add --no-cache git bash

COPY LICENSE /
COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]