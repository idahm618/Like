import requests
import json
from datetime import datetime
from bs4 import BeautifulSoup

# ESPN League Code → Premier League by default
LEAGUE_CODE = "eng.1"  # Change this to 'esp.1', 'ger.1', etc. for other leagues

# ESPN API URL
API_URL = f"https://site.api.espn.com/apis/site/v2/sports/soccer/{LEAGUE_CODE}/scoreboard"

try:
    response = requests.get(API_URL, headers={"User-Agent": "Mozilla/5.0"})
    response.raise_for_status()
    data = response.json()

    fixtures = []
    events = data.get("events", [])

    for event in events:
        competition = event.get("name")
        date = event.get("date")
        utc_time = datetime.strptime(date, "%Y-%m-%dT%H:%MZ")
        local_time = utc_time.strftime("%Y-%m-%d %H:%M")

        teams = [team["team"]["displayName"] for team in event["competitions"][0]["competitors"]]
        home_team, away_team = ("", "")
        for team in event["competitions"][0]["competitors"]:
            if team["homeAway"] == "home":
                home_team = team["team"]["displayName"]
            else:
                away_team = team["team"]["displayName"]

        fixture = {
            "competition": competition,
            "date": local_time,
            "home": home_team,
            "away": away_team
        }
        fixtures.append(fixture)

    # Output HTML for Blogger embedding
    html_output = f"""<script id="matchData" type="application/json">
{json.dumps(fixtures, indent=2)}
</script>"""

    with open("fixtures-output.html", "w", encoding="utf-8") as f:
        f.write(html_output)

    print(f"✅ {len(fixtures)} fixtures written to fixtures-output.html")

except Exception as e:
    print(f"❌ Failed to scrape ESPN: {e}")
