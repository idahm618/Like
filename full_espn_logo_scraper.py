import requests
import json

# FULL hardcoded competition list from ESPN (league codes)
competitions = [
    # Top Club Leagues
    "eng.1", "esp.1", "ita.1", "ger.1", "fra.1", "ned.1", "por.1", "bel.1", "sau.1", "usa.1", "mex.1", "arg.1", "bra.1",
    
    # 2nd divisions
    "eng.2", "esp.2", "ger.2", "ita.2", "fra.2", "mex.2",

    # Domestic Cups
    "eng.fa", "eng.leaguecup", "esp.copa", "ger.pokal", "fra.cup",

    # Confederation Club Tournaments
    "uefa.champions", "uefa.europa", "uefa.europa.conf", "concacaf.champions", "conmebol.libertadores", "conmebol.sudamericana", "caf.champions",

    # International Tournaments (Men)
    "fifa.world", "uefa.euro", "conmebol.copa", "caf.nations", "afc.cup", "concacaf.gold", "concacaf.nations", "fifa.club",

    # World Cup Qualifiers
    "fifa.world.qual.uefa", "fifa.world.qual.conmebol", "fifa.world.qual.caf", "fifa.world.qual.afc", "fifa.world.qual.concacaf",

    # International Tournaments (Women)
    "fifa.wwc", "uefa.euro.women", "concacaf.wwc", "nzl.nsl", "usa.nwsl", "usa.nwsl.challenge", "concacaf.wchampionship", "concacaf.wchampions",

    # College & Regional (US & CONCACAF)
    "usa.ncaam", "usa.ncaaw", "usa.usl", "usa.usl1", "usa.usopen",
    "crc.1", "gtm.1", "slv.1", "hon.1", "concacaf.central"
]

headers = {"User-Agent": "Mozilla/5.0"}
logos = {}

def fetch_teams(league):
    url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/{league}/teams"
    try:
        res = requests.get(url, headers=headers, timeout=10)
        if res.status_code != 200:
            print(f"❌ Failed: {league}")
            return []
        return res.json()["sports"][0]["leagues"][0]["teams"]
    except:
        return []

print("📡 Fetching team logos from ESPN...")
count = 0

for comp in competitions:
    print(f"🔎 {comp}")
    teams = fetch_teams(comp)
    for t in teams:
        try:
            name = t["team"]["displayName"]
            logo = t["team"]["logos"][0]["href"]
            if name not in logos:
                logos[name] = logo
                count += 1
        except:
            continue

# Fallback image
logos["Unknown"] = "https://cdn.jsdelivr.net/gh/rsmouk/teams@main/placeholder.png"

# Save JSON
with open("allEspnTeamLogos.json", "w") as f:
    json.dump(logos, f, indent=2)

print(f"\n✅ Done. Saved {count} team logos to allEspnTeamLogos.json")
