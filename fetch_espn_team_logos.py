import requests
import json

# ESPN league codes
leagues = {
    "Premier League": "eng.1",
    "La Liga": "esp.1",
    "Serie A": "ita.1",
    "Bundesliga": "ger.1",
    "Ligue 1": "fra.1",
    "Saudi Pro League": "sau.1",
    "MLS": "usa.1",
    "UEFA Champions League": "uefa.champions",
    "UEFA Euro": "uefa.euro",
    "Copa America": "conmebol.copa",
    "FIFA World Cup": "fifa.world"
}

all_teams = {}

def get_teams(league_code):
    url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/{league_code}/teams"
    res = requests.get(url)
    if res.status_code != 200:
        print(f"❌ Failed to fetch: {league_code}")
        return []
    data = res.json()
    try:
        teams = data["sports"][0]["leagues"][0]["teams"]
        return teams
    except:
        return []

for league_name, league_code in leagues.items():
    print(f"🔄 Fetching teams from {league_name}")
    teams = get_teams(league_code)
    for t in teams:
        try:
            name = t["team"]["displayName"]
            logo = t["team"]["logos"][0]["href"]
            all_teams[name] = logo
        except:
            continue

# Add fallback
all_teams["Unknown"] = "https://cdn.jsdelivr.net/gh/rsmouk/teams@main/placeholder.png"

# Save output
with open("espn_team_logos.json", "w") as f:
    json.dump(all_teams, f, indent=2)

print(f"\n✅ Done. Saved {len(all_teams)} teams to espn_team_logos.json")
