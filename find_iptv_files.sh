#!/bin/bash

base="https://looooooool.footfast.net"
wordlist=(
  "playlist.m3u"
  "full.m3u"
  "channels.m3u"
  "live.m3u"
  "index.m3u"
  "iptv.m3u"
  "tv.m3u"
  "hd.m3u"
  "all.m3u"
  "channels.m3u8"
  "epg.xml"
  "guide.xml"
  "epg.xml.gz"
  "playlist.json"
  "index.json"
)

echo "🔍 Scanning for IPTV playlist and EPG files on $base..."
echo

for file in "${wordlist[@]}"; do
  url="$base/$file"
  code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [ "$code" = "200" ]; then
    echo "✅ FOUND: $url"
  elif [ "$code" = "403" ]; then
    echo "⛔ FORBIDDEN: $url"
  elif [ "$code" = "401" ]; then
    echo "🔐 UNAUTHORIZED: $url"
  else
    echo "❌ Not found: $url"
  fi
done

echo
echo "✅ Done scanning!"
