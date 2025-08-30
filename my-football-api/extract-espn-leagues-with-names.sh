#!/data/data/com.termux/files/usr/bin/bash

URL="https://www.espn.com/soccer/competitions"
OUT="espn_leagues_with_names.txt"
> "$OUT"

echo "📥 Fetching ESPN Soccer Competitions page..."

curl -s "$URL" | \
grep -Po '(?<=href="/soccer/standings/_/league/)[^"]+">[^<]+' | \
while IFS= read -r line; do
  CODE=$(echo "$line" | cut -d'">' -f1)
  NAME=$(echo "$line" | cut -d'">' -f2)
  echo -e "$CODE\t$NAME"
done | tee "$OUT"

echo -e "\n✅ Done. Results saved in $OUT"
