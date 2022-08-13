#!/usr/bin/env python

from __future__ import division, print_function

import json
import os
import os.path


def is_host_kaggle():
    return os.path.split(os.getcwd())[0] == "/kaggle"


def write_dataset(fname, tracks):
    if is_host_kaggle():
        raise Exception("Error: not writing dataset on Kaggle")
    else:
        with open(fname, 'w') as f:
            json.dump(tracks, f)


def load_dataset(fname):
    """
    Automatically resolves to /kaggle/input/spotify
    if first directory after rootdir is "/kaggle",
    otherwise looks in cwd
    """
    if is_host_kaggle():
        fname = os.path.join("/kaggle/input/spotify", fname)
    with open(fname, 'r') as f:
        j = json.load(f)
    return j


def load(fname):
    return Playlist(fname)


class Playlist(object):
    def __init__(self, fname):
        tracks = load_dataset(fname)
        self.tracks = tracks
        self.data = tracks  # just a convenient alias

    def get(self, feature):
        return [t[feature] for t in self.tracks]

    def show_features(self):
        # https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features
        for k in sorted(self.tracks[0]):
            print(k)

    def show_data(self):
        # https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features
        for t in self.tracks:
            print(t['name'])
            print(t['artist'])
            #print("name", '"{:s}"'.format(t['name']))
            #print("artist", '"{:s}"'.format(t['artist']))
            for k in sorted(t):
                if k not in ['name', 'artist']:
                    if isinstance(t[k], str):
                        # not being very careful about sanitizing strings
                        # for characters that need to be escaped and such
                        print("\t{:20s}".format(k), '"{:s}"'.format(t[k]))
                    else:
                        print("\t{:20s}".format(k), t[k])