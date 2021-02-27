#!/bin/bash -e

# Differentiate between direct push and pull request

# Prerequisites:
# Define `env` in action with:
#   TMP_PULL_HEAD_REF: ${{ github.head_ref }}
TMP_GITHUB_REF="${GITHUB_REF#refs/heads/}"

EXPORT_VALUE=""
if [ "${TMP_PULL_HEAD_REF}" != "" ]
then
    EXPORT_VALUE="${TMP_PULL_HEAD_REF}"
else
    EXPORT_VALUE="${TMP_GITHUB_REF}"
fi

echo "##[set-output name=branch;]$(echo ${EXPORT_VALUE})"
