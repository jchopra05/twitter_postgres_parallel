#!/bin/sh

python3 load_tweets.py --db=postgresql://postgres:pass@localhost:3029 --inputs "$1"
