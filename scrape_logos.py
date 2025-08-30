import requests
from bs4 import BeautifulSoup
import json
import re

BASE = "https://www.worldfootball.net"
headers = {"User-Agent": "Mozilla/5.0"}

logos = {}

def clean_name(name):
    """Remove unwanted suffixes/prefixes like FC, CF"""
    name = re.sub(r'\b(FC|CF|SC|AC|AFC|C.F.|F.C.)\b', '', name, flags=re.IGNORECASE)
    return name.strip()

def scrape_from(url):
    res = requests.get(url, headers=headers)
    soup = BeautifulSoup(res.text, "html.parser")
    rows = soup.select("table.standard_tabelle tr")

    count = 0
    for row in rows:
        img = row.find("img")
        link = row.find("a")
        if img and link:
            team_name = clean_name(link.text.strip())
            logo_url = BASE + img['src'].strip()
            if team_name not in logos:
                logos[team_name] = logo_url
                count += 1
    return count

# Scrape clubs
print("🔄 Scraping club teams...")
club_count = scrape_from(BASE + "/teams/")

# Scrape national teams
print("🔄 Scraping national teams...")
nat_count = scrape_from(BASE + "/teams/national-teams/")

# Optional: Add fallback
FALLBACK = "https://cdn.jsdelivr.net/gh/rsmouk/teams@main/placeholder.png"
if "Unknown" not in logos:
    logos["Unknown"] = FALLBACK

# Output to JSON
with open("teamLogos.json", "w") as f:
    json.dump(logos, f, indent=2)

print(f"✅ Done! {club_count} clubs + {nat_count} countries scraped.")
print("📄 Saved as teamLogos.json")
