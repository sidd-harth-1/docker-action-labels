#!/bin/sh

# Parse GitHub event JSON file
GITHUB_TOKEN=$1
LABELS=$2
ISSUE_NUMBER=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")
URL=$(jq --raw-output .issue.repository_url "$GITHUB_EVENT_PATH")

# Assign a labels to an issue
curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  $URL/issues/$ISSUE_NUMBER/labels \
  -d '{"labels":$LABELS}'