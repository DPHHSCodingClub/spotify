#!/usr/bin/env bash

# To access Spotify developer API, you need an account.
# Once you have an account, visit
#     https://developer.spotify.com/dashboard/applications
# Click "Create an app"
# Enter your Client ID and Client Secret into the variables as strings, below.

# NOTE: the encoding from echo "..." | base64
# gives a different result than https://www.base64encode.org/
# which is caused by a newline at the end of the string, so need
# "-n" argument to echo

CLIENT_ID="asdf"
CLIENT_SECRET="asdf"
CLIENT_ENCODED=$(echo -n "${CLIENT_ID}:${CLIENT_SECRET}" | base64)

curl \
  -H "Authorization: Basic ${CLIENT_ENCODED}" \
  -X "POST" "https://accounts.spotify.com/api/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Accept: application/json" \
  -d "grant_type=client_credentials"
