import requests
from bs4 import BeautifulSoup
import json
import re

BASE = "https://www.worldfootball.net"
HEADERS = {"User-Agent": "Mozilla/5.0"}

# URLs to scrape

# 1. National team competitions
national_competitions = {
    "EURO 2024": "/teams/em-europameisterschaft-2024-in-deutschland/",
    "Copa America 2024": "/teams/am-copa-america-2024-usa/",
    "AFCON 2023": "/teams/afr-africa-cup-2023-ivory-coast/",
    "World Cup 2026": "/teams/wm-weltmeisterschaft-2026-kanada-usa-mexiko/"
}

# 2. Major club leagues 2025/26 season (you can add more)
club_leagues = [
    "/teams/eng-premier-league-2025-2026/",
    "/teams/esp-primera-division-2025-2026/",
    "/teams/ita-serie-a-2025-2026/",
    "/teams/ger-bundesliga-2025-2026/",
    "/teams/fra-ligue-1-2025-2026/",
    "/teams/sau-saudi-professional-league-2025-2026/",
    "/teams/usa-major-league-soccer-2025/"
]

logos = {}

def clean_name(name):
    return re.sub(r'\b(FC|CF|SC|AC|AFC|C\.F\.|F\.C\.)\b', '', name, flags=re.IGNORECASE).strip()

def scrape_teams(path):
    url = BASE + path
    print(f"Scraping: {url}")
    res = requests.get(url, headers=HEADERS)
    soup = BeautifulSoup(res.text, "html.parser")
    rows = soup.select("table.standard_tabelle tr")
    count = 0
    for row in rows:
        img = row.find("img")
        link = row.find("a")
        if img and link:
            team_name = clean_name(link.text.strip())
            src = img['src'].strip()
            logo_url = src if src.startswith("http") else BASE + src
            if team_name and team_name not in logos:
                logos[team_name] = logo_url
                count += 1
    return count

total_scraped = 0

# Scrape all national teams
for comp_name, comp_url in national_competitions.items():
    print(f"--- Scraping national teams for {comp_name} ---")
    total_scraped += scrape_teams(comp_url)

# Scrape all club teams
for league_url in club_leagues:
    print(f"--- Scraping club teams for league {league_url.split('/')[-2]} ---")
    total_scraped += scrape_teams(league_url)

# Add fallback for unknown teams
logos["Unknown"] = "https://cdn.jsdelivr.net/gh/rsmouk/teams@main/placeholder.png"

# Save all logos to JSON file
with open("allTeamLogos.json", "w") as f:
    json.dump(logos, f, indent=2)

print(f"\n✅ Done! Total teams scraped: {total_scraped}")
print("Saved all logos to allTeamLogos.json")
