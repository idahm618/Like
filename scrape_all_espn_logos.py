import requests
import json

base_url = "https://site.api.espn.com/apis/site/v2/sports/soccer/"
headers = {"User-Agent": "Mozilla/5.0"}

logos = {}

def get_leagues():
    res = requests.get(base_url, headers=headers)
    data = res.json()
    leagues = []
    try:
        for sport in data['sports']:
            for league in sport['leagues']:
                leagues.append({
                    "name": league["name"],
                    "abbrev": league["id"]  # Example: "eng.1"
                })
    except:
        print("⚠️ Failed to parse leagues")
    return leagues

def get_teams(league_id):
    team_url = f"{base_url}{league_id}/teams"
    res = requests.get(team_url, headers=headers)
    if res.status_code != 200:
        return []
    try:
        teams = res.json()['sports'][0]['leagues'][0]['teams']
        return teams
    except:
        return []

def main():
    leagues = get_leagues()
    total = 0
    for league in leagues:
        print(f"🔍 {league['name']} ({league['abbrev']})")
        teams = get_teams(league["abbrev"])
        for team in teams:
            try:
                name = team["team"]["displayName"]
                logo = team["team"]["logos"][0]["href"]
                logos[name] = logo
                total += 1
            except:
                continue

    # Add fallback
    logos["Unknown"] = "https://cdn.jsdelivr.net/gh/rsmouk/teams@main/placeholder.png"

    # Save
    with open("allEspnTeamLogos.json", "w") as f:
        json.dump(logos, f, indent=2)

    print(f"\n✅ Saved {total} logos to allEspnTeamLogos.json")

if __name__ == "__main__":
    main()
