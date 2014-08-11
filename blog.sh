#!/bin/sh

cd ./ruhoh
ruhoh compile
rsync -arv ./compiled/blog/ ../public/blog/
rsync -a ./compiled/rss.xml ../public/rss.xml
