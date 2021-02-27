#!/bin/bash -e

# Generates the dedicated branch if necessary

generate_branch () {
    # Create a dettached (orphan) branch
    git checkout --orphan "${INPUT_BRANCH}"

    # Create a dedicated README file, so it's clear what's going on here
    echo '# Badges branch' > README.md
    git add README.md
    git commit -m 'Add dedicated README'
}

mkdir -p "${INPUT_PATH}"
cp -par .git "${INPUT_PATH}"

pushd "${INPUT_PATH}"
    git checkout "${INPUT_BRANCH}" || generate_branch
    mkdir -p "${CURRENT_BRANCH}"
popd
