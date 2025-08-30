import requests
import json
from datetime import datetime, timedelta

leagues = {
    "eng.1": "Premier League",
    "esp.1": "La Liga",
    "ita.1": "Serie A",
    "ger.1": "Bundesliga",
    "fra.1": "Ligue 1",
    "ned.1": "Eredivisie",
    "mex.1": "Liga MX",
    "por.1": "Liga Portugal",
    "usa.1": "MLS",
    "bra.1": "Brasileirão",
    "arg.1": "Liga Profesional Argentina",
    "uefa.champions": "Champions League",
    "uefa.europa": "Europa League",
    "fifa.world": "FIFA World Cup",
    "eng.fa": "FA Cup",
    "int.friendly": "International Friendly",
}

fixtures = []
today = datetime.utcnow()

for league_id, league_name in leagues.items():
    print(f"\n📅 Fetching for league: {league_name}")
    for i in range(365):
        check_date = today + timedelta(days=i)
        date_str = check_date.strftime("%Y%m%d")

        url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/{league_id}/scoreboard?dates={date_str}"

        try:
            r = requests.get(url, headers={"User-Agent": "Mozilla/5.0"})
            r.raise_for_status()
            data = r.json()

            events = data.get("events", [])
            for event in events:
                dt = datetime.strptime(event["date"], "%Y-%m-%dT%H:%MZ")
                match_time = dt.strftime("%Y-%m-%d %H:%M")

                comp = event.get("name", league_name)
                competitors = event["competitions"][0]["competitors"]
                home = away = ""
                for team in competitors:
                    if team["homeAway"] == "home":
                        home = team["team"]["displayName"]
                    else:
                        away = team["team"]["displayName"]

                fixtures.append({
                    "competition": comp,
                    "league": league_name,
                    "date": match_time,
                    "home": home,
                    "away": away
                })

            print(f"✅ {date_str}: {len(events)} match(es)")

        except Exception as e:
            print(f"⚠️ {league_id} on {date_str}: {e}")

# Save as a Blogger-compatible script
output = f"""<script id="matchData" type="application/json">
{json.dumps(fixtures, indent=2)}
</script>"""

with open("fixtures-output.html", "w", encoding="utf-8") as f:
    f.write(output)

print(f"\n✅ {len(fixtures)} total fixtures saved to fixtures-output.html")
