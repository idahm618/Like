#!/data/data/com.termux/files/usr/bin/bash

# Step 1: Define the target page (you can change it to another ESPN page)
URL="https://www.espn.com/soccer/schedule"

# Step 2: Download the page
echo "🔍 Fetching ESPN Soccer Schedule page..."
curl -s "$URL" -o espn_schedule.html

# Step 3: Extract URLs that look like API endpoints
echo "🔎 Extracting likely API URLs..."
grep -oP 'https://[^"]+/(scoreboard|summary|teams|standings|news)[^"]*' espn_schedule.html | sort -u > espn_api_list.txt

# Step 4: Show the results
echo -e "\n✅ Found API-like endpoints:"
cat espn_api_list.txt
