README
======

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/DPHHSCodingClub/spotify/HEAD?labpath=analysis.ipynb)

Inspect Spotify's top hits playlists and see what we can learn.
* What kind of data does Spotify extract and keep for each song? (which in turn
  helps it recommend songs to us)
* How have the properties of top-hit songs changed over the last few decades?

This project also has code to query Spotify's servers for the most up-to-date
data using HTTPS (same protocol used by Chrome and all browsers to serve
webpages to you).  A little more detail below.

How to download data from Spotify
---------------------------------

1. Ask Spotify for permission to pull data from its servers.  This requires an
"OAuth token", which is a password that's only valid for 1 hour, details at
footnote (1).  The instructions show a Javascript way of getting the password,
but you can do it in Python too.

2. Using the OAuth token, send HTTPS requests to Spotify's servers to get the
data.  Then, process the data -- pick out only the pieces we want, and discard
the rest (this requires lots of experimenting, not shown in the final code).
The notebook that I used to do this is here:

    https://www.kaggle.com/atrancu/coding-club-make-spotify-datasets/edit

This uses the "requests" library in Python (footnote 2), which hides almost all(!) of
the detail of how HTTPS works (i.e., the "requests" library is a very good
abstraction layer!).  The HTTPS requests are indeed the same protocol used by
Chrome, Safari, etc. to help pull up websites on your computer.

3. Make a home-made library, to try to present the data in a cleaner way for
coding club.  You can see the actual code here:

    https://www.kaggle.com/code/atrancu/coding-club

Under `class Playlist(object):`, you can see the code we used in the `get(...)`
and `show_data(...)` methods today.

Footnotes
1. https://developer.spotify.com/documentation/general/guides/authorization/client-credentials/
2. https://requests.readthedocs.io/en/latest/
