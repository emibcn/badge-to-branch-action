#!/bin/bash -e

pushd "${INPUT_PATH}"
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"

    # Add the generated SVG file
    PATH_FILE="${CURRENT_BRANCH}/${INPUT_FILENAME}"
    git add "${PATH_FILE}"

    # Echo the step and action output
    REPO_URL="https://github.com/${GITHUB_REPOSITORY}"
    echo "##[set-output name=url;]$(echo "${REPO_URL}/raw/${INPUT_BRANCH}/${PATH_FILE}")"

    # Will give error if badge did not changed
    git commit -m "Add/Update badge" || true
popd
