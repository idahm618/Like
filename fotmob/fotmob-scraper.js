const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs");

(async () => {
  const url = "https://www.fotmob.com/teams/9825/fixtures"; // Man Utd fixtures page

  try {
    const res = await axios.get(url, {
      headers: {
        "User-Agent": "Mozilla/5.0"
      }
    });

    const $ = cheerio.load(res.data);
    const scriptData = $('script[type="application/json"]').first().html();

    const nuxt = JSON.parse(scriptData);
    const matches = nuxt.state[0]?.data?.fixtures?.allMatches || [];

    const upcoming = matches
      .filter(match => match.status?.utcTime && match.status?.matchStatus === "NS")
      .map(match => ({
        home: match.home.name,
        away: match.away.name,
        time: match.status.utcTime.split("T")[1].slice(0, 5),
        date: match.status.utcTime.split("T")[0]
      }));

    const output = `<script id="matchData" type="application/json">\n${JSON.stringify(upcoming, null, 2)}\n</script>`;
    fs.writeFileSync("fixtures-output.html", output);

    console.log("✅ Scraped fixtures written to fixtures-output.html");
  } catch (err) {
    console.error("❌ Failed to scrape fixtures:", err.message);
  }
})();const axios = require("axios");
const fs = require("fs");

(async () => {
  const fotmobTeamId = "9825"; // Manchester United, change if needed
  const url = `https://www.fotmob.com/api/teams?id=${fotmobTeamId}&ccode=INT`;

  try {
    const res = await axios.get(url, {
      headers: { "User-Agent": "Mozilla/5.0" }
    });

    const fixtures = res.data.fixtures.matches;
    const upcoming = fixtures
      .filter(match => match.status === "NS") // Not started
      .map(match => {
        return {
          home: match.home.name,
          away: match.away.name,
          time: match.time?.utcTime.split("T")[1]?.slice(0, 5) || "TBD",
          date: match.time?.utcTime.split("T")[0] || "TBD"
        };
      });

    const output = `<script id="matchData" type="application/json">\n${JSON.stringify(upcoming, null, 2)}\n</script>`;

    fs.writeFileSync("fixtures-output.html", output);
    console.log("✅ Scraped fixtures written to fixtures-output.html");
  } catch (err) {
    console.error("❌ Failed to scrape FotMob:", err.message);
  }
})();
