#!/bin/bash

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
time echo "$files" | parallel ./load_denormalized.sh

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time echo "$files" | parallel ./load_tweets.py --db "postgresql://postgres:pass@localhost:2029" --inputs {} 

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
time echo "$files" | parallel ./load_tweets_batch.py --db "postgresql://postgres:pass@localhost:2030" --inputs {}
