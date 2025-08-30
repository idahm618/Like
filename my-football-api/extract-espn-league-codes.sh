#!/data/data/com.termux/files/usr/bin/bash

# Source page listing leagues
URL="https://www.espn.com/soccer/competitions"

# Output file
OUT="espn_league_codes.txt"
> "$OUT"

echo "📥 Fetching leagues from $URL..."

# Fetch and extract links with league codes (like eng.1, esp.1, etc.)
curl -s "$URL" | grep -oP '/soccer/standings/_/league/\K[^"]+' | sort -u | tee "$OUT"

echo -e "\n✅ Done. League codes saved in $OUT"
