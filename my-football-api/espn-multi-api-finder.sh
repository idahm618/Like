#!/data/data/com.termux/files/usr/bin/bash

# ESPN pages to scan
URLS=(
  "https://www.espn.com/college-baseball/scoreboard"
  "https://www.espn.com/mlb/scoreboard"
  "https://www.espn.com/nba/draft/news"
  "https://www.espn.com/nfl/draft/news"
  "https://www.espn.com/nhl/scoreboard"
  "https://www.espn.com/soccer/standings/_/league/usa.1"
  "https://www.espn.com/tennis/scoreboard"
  "https://www.espn.com/wnba/scoreboard"
)

# Output file
OUT="espn_all_api_endpoints.txt"
> "$OUT"

echo "🔎 Starting ESPN API scan..."
echo "============================="

# Loop over each URL
for url in "${URLS[@]}"; do
  echo "📄 Scanning: $url"
  
  # Fetch page and extract API-like URLs
  curl -s "$url" | \
    grep -oP 'https://[^"]+(site\.api|cdn\.espn|scoreboard|summary|standings)[^"]*' | \
    sort -u | tee -a "$OUT"

  echo "-----------------------------"
done

echo -e "\n✅ Scan complete. Results saved in: $OUT"
