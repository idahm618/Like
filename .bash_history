http://localhost:8082/multi-channels.html?channel=sky_football
pkg update && pkg upgrade
pkg install python
mv /internal storage/downloa/hls_player.zip
mv /internal storage/download/hls_player.zip
mv /internal storage/Download/hls_player.zip ~/
mv /storage/emulated/0/Download/hls_player.zip ~/
/termux-setup-storage
termux-setup-storage
mv /storage/emulated/0/Download/hls_player.zip ~/
pkg install unzip
unzip ~/hls_player.zip -d ~/hls_player
cd ~/hls_player
python -m http.server 8080
mv /storage/emulated/0/Download/multi-channels.html ~/
cd ~
python3 -m http.server 8080
cd /storage/emulated/0/Download
python3 -m http.server 8082
mkdir -p ~/.termux/boot
nano ~/.termux/boot/start-server.sh
ls ~/.termux/boot
chmod +x ~/.termux/boot/start-server.sh #!/data/data/com.termux/files/usr/bin/bash
cd /storage/emulated/0/Download
nohup python3 -m http.server 8082 > /dev/null 2>&1 &
mv /storage/emulated/0/Download/Jason/stream_selection.html ~/storage/shared/stream_selection.html
cd ~/storage/shared
python3 -m http.server 8089
cd /storage/emulated/0/Download
python3 -m http.server 8090
cd ~/storage/shared
python3 -m http.server 8088
termux-setup-storage
chmod +x ~/script_name.sh
lmv /storage/emulated/0/Download/Jason/stream_selection.html ~/stream_selection.html
pkg update && pkg upgrade
node -v
npm -v
[200~nano index.js~
pkg install nano
nano index.js
pkg install nodejs
npm init -y
npm install express node-fetch cors
node index.js
nano index.js
pkg install nodejs
npm init -y
npm install express node-fetch cors
node index.js
pkg update
pkg install ffmpeg tesseract python -y
nano streams.txt
nano scan_channels.py
python scan_channels.py
ffmpeg -i "https://looooooool.footfast.net/event/1.m3u8"
ffmpeg -allowed_extensions ALL -i "https://looooooool.footfast.net/event/1.m3u8" -c copy output.ts
ls ~/espn/
cat ~/espn/fixtures-output.html | termux-clipboard-set
cp ~/espn/fixtures-output.html ~/storage/downloads/
ls ~/storage/downloads/
ls -lh ~/espn/fixtures-output.html
cp ~/espn/fixtures-output.html ~/storage/downloads/
termux-open ~/espn/fixtures-output.html
termux-setup-storage
cp ~/espn/fixtures-output.html ~/storage/downloads/
termux-open ~/espn/fixtures-output.html
cat fixtures-output.json | termux-clipboard-set
ls ~/espn/
cp ~/espn/fixtures-output.html ~/storage/downloads/
less ~/espn/fixtures-output.html
pkg update && pkg upgrade
pkg install git python -y
git clone https://github.com/Vicecap/Team-logos.git
cd Team-logos
nano generate_logos_json.py
python generate_logos_json.py
cat team_logos.json
git add team_logos.json
git commit -m "Add logo mapping"
git push
cd ~/espn
cat fixtures-output.html | termux-clipboard-set
ls ~/espn/
cat fixtures-output.html | termux-clipboard-set
cd ~/espn/Team-logos
nano extract_teams.py
python extract_teams.py
mv ~/espn/fixtures-output.html ~/espn/Team-logos/
cd ~/espn/Team-logos
python extract_teams.py
mv ~/espn/fixtures-output.html ~/espn/Team-logos/
cd ~/espn/Team-logos
python extract_teams.py
cat unique_teams.txt
git add index.html
git commit -m "Add index.html for GitHub Pages"
git push
nano scrape_all_espn_logos.py
python scrape_all_espn_logos.py
pkg update && pkg upgrade
pkg install python
pip install requests beautifulsoup4
nano scrape_logos.py
python scrape_logos.py
cat teamLogos.json
nano scrape_all_national_logos.py
python scrape_all_teams.py
nano fetch_espn_team_logos.py
python fetch_espn_team_logos.py
cat allTeamLogos.json
cat espn_team_logos.json
nano full_espn_logo_scraper.py
python full_espn_logo_scraper.py
cat allEspnTeamLogos.json
nano scrape_all_teams.py
python scrape_all_teams.py
cat allTeamLogos.json
pkg update
pkg install curl
time curl -s https://vicecap.github.io/Huh/
curl -o /dev/null -s -w "%{time_total}\n" https://vicecap.github.io/Huh/
time curl -s https://vicecap.github.io/Huh/ | grep -q "Jason"
curl -X PUT   -H "Authorization: token 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"   -H "Content-Type: application/json"   --data '{"message":"Auto-update matches.json","content":"$(echo -n "{\"success\":true,\"matches\":[{\"league\":\"Premier League\",\"teams\":[\"Liverpool\",\"AFC Bournemouth\"],\"score\":\"0 - 0\",\"status\":\"Scheduled\",\"date\":\"2025-08-15T19:00Z\",\"venue\":\"Anfield\"}]}\" | base64 -w 0)"}'   "https://api.github.com/repos/Vicecap/Mates/"
curl -H "Authorization: token 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" https://api.github.com/user
mkdir api
nano api/espn.js
npm init -y
npm install node-fetch
git init
git branch -m main
git add .
git commit -m "Initial commit: Add ESPN proxy function"
git add .
git commit -m "Initial commit: Add ESPN proxy function"
git branch -M main
git push -u origin main
nano api/espn.js
git add .
git commit -m "Fix: use native fetch and Vercel-compatible format"
git push
nano api/espn.js
git add .
git commit -m "Fix: use native fetch and Vercel-compatible format"
git push
nano api/espn.js
git add .
git commit -m "Fix: use native fetch and Vercel-compatible format"
git push
pkg update
pkg install curl jq
sleep 4 && curl -s https://vicecap.github.io/Huh/ | jq
termux-change-repo
pkg update
pkg upgrade
pkg install curl jq
sleep 4 && curl -s https://vicecap.github.io/Huh/ | jq
curl -s https://vicecap.github.io/Huh/
mkdir espn-proxy
cd espn-proxy
nano api/espn.js
mkdir api
mv espn.js api/
termux-open-url "https://github.com/search?q=site.api.espn.com"
curl -v https://espn-one.vercel.app/api/espn
curl -s https://espn-one.vercel.app/api/espn | jq '.[] | {league: .league, home: .home_team, away: .away_team, status: .status, home_score: .home_score, away_score: .away_score}'
curl -s https://espn-one.vercel.app/api/espn
curl -s "https://site.api.espn.com/apis/site/v2/sports/soccer/world.1/scoreboard?dates=$(date +%Y%m%d)" | jq
curl -s https://www.espn.com/soccer/schedule > schedule.html
grep -oP 'https://[^"]*?scoreboard[^"]*' schedule.html
nano espn-api-finder.sh
chmod +x espn-api-finder.sh
./espn-api-finder.sh
nano espn-multi-api-finder.sh
chmod +x espn-multi-api-finder.sh
./espn-multi-api-finder.sh
nano extract-espn-league-codes.sh
chmod +x extract-espn-league-codes.sh
./extract-espn-league-codes.sh
nano extract-espn-leagues-with-names.sh
chmod +x extract-espn-fixtures.sh
./extract-espn-fixtures.sh
nano extract-espn-leagues-with-names.sh
chmod +x extract-espn-leagues-with-names.sh
./extract-espn-leagues-with-names.sh
cat espn_leagues_with_names.txt
nano extract-espn-leagues-with-names.sh
chmod +x extract-espn-leagues-with-names.sh
./extract-espn-leagues-with-names.sh
cat espn_leagues_with_names.txt
pkg update && pkg upgrade
pkg install nodejs git
node -v
npm -v
vercel login
npm install -g vercel
vercel login
mkdir my-football-api
cd my-football-api
mkdir -p api
nano api/football.js
vercel
mkdir espn-multi
cd espn-multi
git init
mkdir api
touch api/espn.js
touch package.json
nano api/espn.js
nano package.json
git remote add origin https://github.com/Vicecap/espn-multi.git
git add .
git commit -m "Initial ESPN multi-league API"
git branch -M main
git push -u origin main
git remote set-url origin https://github.com/Vicecap/espn-multi.git
git push -u origin main
cd ~/my-football-api/espn-multi
nano leagues.js
git add leagues.js
git commit -m "Added all league codes"
git push
cd ~/my-football-api/espn-multi/api
nano espn.js
git add api/espn.js
git commit -m "Updated espn API to support all leagues"
git push
git push -u origin main
echo "// trigger redeploy" >> api/espn.js
git add .
git commit -m "Trigger redeploy"
git push
node api/espn.js
node espn.js
node football-api-test.js
nano football-api-test.js
node football-api-test.js
npm install node-fetch@2
nano football-api-test.js
node football-api-test.js
pkg install ffmpeg -y
ffprobe "http://familyip.vip/BC_464/index.m3u8?token=8982b7ebf78d2458e43727235ab58a02"
pkg install curl jq -y
#!/data/data/com.termux/files/usr/bin/bash
LEAGUES=(   'eng.1' 'esp.1' 'ita.1' 'ger.1' 'fra.1'   'eng.3' 'ned.1' 'por.1' 'eng.2' 'bra.1'   'arg.copa_lpf' 'uefa.europa_qual' 'uefa.champions_qual' 'fifa.worldq.conmebol' 'fifa.worldq.afc'   'ind.1' 'uefa.nations' 'uefa.champions' 'uefa.europa' 'uefa.conference_qual'   'fifa.world' 'conmebol.libertadores' 'nga.1' 'caf.nations'   'uefa.europa.conf' 'afc.cup' 'fifa.Worldq.caf' 'afc.champions' 'club.friendly'   'idn.1' 'ksa.1' 'rsa.1' 'zim.1' 'eng.charity' 'uefa.super_cup' 'concacaf.leagues.cup' 'usa.1' 'mex.1' )
OUTPUT="clubs_mapping.txt"
JSONOUT="clubs_mapping.json"
echo "" > $OUTPUT
echo "[]" > $JSONOUT
for league in "${LEAGUES[@]}"; do   echo "=== Fetching $league ===";   data=$(curl -s "https://site.api.espn.com/apis/site/v2/sports/soccer/$league/teams");      teams=$(echo "$data" | jq -r '.sports[0].leagues[0].teams[]? | "\(.team.displayName) - \(.team.id)"');      if [ -n "$teams" ]; then     echo "=== $league ===" >> $OUTPUT;     echo "$teams" >> $OUTPUT;     
    echo "$data" | jq '[.sports[0].leagues[0].teams[]? | {league:"'"$league"'", name:.team.displayName, id:.team.id}]'       | jq -s 'add' >> temp.json;   fi; done
# Merge all JSON arrays
jq -s 'add' temp.json > $JSONOUT
rm temp.json
echo "✅ Done. Saved to:"
echo "- $OUTPUT (readable text)"
echo "- $JSONOUT (structured JSON)"
ls
cat clubs_mapping.txt | less
git clone --bare https://github.com/Vicecap/ESPN-.git
cd ESPN-.git
git push --mirror https://github.com/Vicecap/Apii.git
cat clubs_mapping.txt
git clone --bare https://github.com/Vicecap/apii.git
cd apii.git
git push --mirror git clone --bare https://github.com/idahm618/love.git
git push --mirror https://github.com/idahm618/love.git
pkg update
pkg install curl wget lynx htmlq
curl -I https://www.totalsportslive.co.zw/p/laliga_3.html
curl -L https://www.totalsportslive.co.zw/p/laliga_3.html -o test.html
ls -lh test.html
head -n 40 test.html
# Count total <img> tags
grep -c "<img" test.html
# List the first 20 image URLs (look for /w1600, /w2000, etc.)
grep -o "https://blogger.googleusercontent.com[^']*" test.html | head -n 20
# Count total <script> tags
grep -c "<script" test.html
# Backup first
cp test.html test_backup.html
# Replace all /sXXXX/ (where XXXX ≥ 1000) with /s600/
sed -E 's#/s([0-9]{4,})/#/s600/#g' test.html > test_fixed.html
grep -o "https://blogger.googleusercontent.com[^']*s[0-9]\{3,\}[^']*" test_fixed.html | head
# Backup first
cp test.html test_backup.html
# Replace all /sXXXX/ with /s600/
sed -E 's#/s[0-9]+/#/s600/#g' test.html > test_fixed.html
termux-open test_fixed.html
pip install soccerdata
pkg update -y && pkg upgrade -y && pkg install -y clang python python-dev libxml2 libxml2-dev libxslt libxslt-dev python-pip && pip install --no-cache-dir soccerdata
pkg update && pkg upgrade
pkg install git
git config --global user.name "IdahM618"
git config --global user.email "idahm618@gmail.com"
mkdir Lovee
cd Lovee
git init
mkdir -p pages/api
nano pages/api/extractor.js
git add .
git commit -m "Initial commit: extractor API"
git remote add origin https://github.com/idahm618/Lovee.git
git branch -M main
git push -u origin main
git push origin main --force
vercel
ls pages/api
curl~https://lovee-rust.vercel.app/api/extractor?
curl "https://lovee-rust.vercel.app/api/extractor?url=https://www.totalsportslive.online/p/live5.html"
vercel --prod
vercel logout
vercel login
vercel --prod
curl "https://lovee-rust.vercel.app/api/extractor?url=https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
curl "https://lovee-cj76afd4n-idahs-projects-317e00dd.vercel.app/api/extractor?url=https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
https://lovee-cj76afd4n-idahs-projects-317e00dd.vercel.app/api/extractor?url=https://www.totalsportslive.online/p/live5.html
vercel --prod
curl "https://lovee-cj76afd4n-idahs-projects-317e00dd.vercel.app/api/extractor?url=https://www.totalsportslive.online/p/live5.html"
cd ~/Lovee
ls pages/api
vercel --prod --force
curl "https://lovee-q9b9npa3c-idahs-projects-317e00dd.vercel.app/api/extractor?url=https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
