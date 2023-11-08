#!/bin/sh

# Get Token and labels from GitHub Action inputs
GITHUB_TOKEN=$1
LABELS=$2

# Parse GitHub event JSON file
ISSUE_NUMBER=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")
URL=$(jq --raw-output .issue.repository_url "$GITHUB_EVENT_PATH")


# Assign a labels to an issue
curl -Lv \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -d "{\"labels\":$LABELS}" \
  $URL/issues/$ISSUE_NUMBER/labels