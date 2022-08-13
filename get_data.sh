#!/usr/bin/env bash

# put your OAuth token, obtained from get_oauth.sh, into the variable below
token=""

###### query to get a single track

#curl --request GET \
#  'https://api.spotify.com/v1/tracks/2TpxZ7JUBn3uw46aR7qd6V' \
#   --header "Authorization: Bearer ${token}"

#curl --request GET \
#  'https://api.spotify.com/v1/tracks/11dFghVXANMlKmJXsNCbNl' \
#   --header "Authorization: Bearer ${token}"

###### query to get a playlist of tracks

# Viral 50 (daily) - USA
# https://open.spotify.com/playlist/37i9dQZEVXbKuaTI1Z1Afx?si=b68b10305177484b

# Top 50 (daily) - USA
# https://open.spotify.com/playlist/37i9dQZEVXbLRQDuF5jeBp?si=edb45e0aa91e415b

# Top 50 (weekly) - USA
# https://open.spotify.com/playlist/37i9dQZEVXbLp5XoPON0wI?si=d61fd9e600544c57

curl -X "GET" "https://api.spotify.com/v1/playlists/37i9dQZEVXbLp5XoPON0wI" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer ${token}"

