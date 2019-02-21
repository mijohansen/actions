#!/bin/bash

set -e
set -o pipefail

export PUSH_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
export RELEASE_VERSION="v$(TZ="Europe/Oslo" date +%Y%m%d%H%M)_$(git rev-parse --short HEAD)";
# If this is not a pull_request, the branch is master and its not tagged. Then create a new tag.
if [[ "${GITHUB_REF}" = "refs/heads/master" ]]; then
    git checkout master
    git config user.name team-foreldrepenger[bot]
    git config user.email team-foreldrepenger[bot]@users.noreply.github.com
    git config --list
    git tag ${RELEASE_VERSION}
    git remote set-url origin ${PUSH_URL}
    git push origin tag ${RELEASE_VERSION}
    echo "Pushing the new version ${RELEASE_VERSION} to $GITHUB_REPOSITORY as $GITHUB_ACTOR"
else
    echo "Will not bump version on branch ${GITHUB_REF} not on master."
fi
