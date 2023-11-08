#!/bin/sh

# Parse GitHub event JSON file
GITHUB_TOKEN=$1
LABELS=$2
ISSUE_NUMBER=$(jq --raw-output .issue.number "$GITHUB_EVENT_PATH")
URL=$(jq --raw-output .issue.repository_url "$GITHUB_EVENT_PATH")

echo -------------------------------------------------------------------------------
echo "$URL/issues/$ISSUE_NUMBER/labels"
echo -------------------------------------------------------------------------------
echo $LABELS
echo -------------------------------------------------------------------------------
echo "  -d '{\"labels\":$LABELS}'"
echo -------------------------------------------------------------------------------


# Assign a labels to an issue
curl -Lv \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -d "{\"labels\":$LABELS}" \
  $URL/issues/$ISSUE_NUMBER/labels