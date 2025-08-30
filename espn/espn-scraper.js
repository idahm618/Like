const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs");

(async () => {
  const url = "https://www.espn.com/soccer/team/fixtures/_/id/360"; // Manchester United

  try {
    const res = await axios.get(url, {
      headers: {
        "User-Agent": "Mozilla/5.0"
      }
    });

    const $ = cheerio.load(res.data);
    const fixtures = [];

    $("section .Table__TR").each((_, el) => {
      const columns = $(el).find(".Table__TD");

      if (columns.length >= 3) {
        const date = $(columns[0]).text().trim();
        const opponent = $(columns[1]).text().trim();
        const time = $(columns[2]).text().trim();

        // Ignore headers or blank rows
        if (date && opponent && time && !opponent.includes("vs") && !opponent.includes("Match")) {
          fixtures.push({
            opponent,
            date,
            time
          });
        }
      }
    });

    const output = `<script id="matchData" type="application/json">\n${JSON.stringify(fixtures, null, 2)}\n</script>`;
    fs.writeFileSync("fixtures-output.html", output);

    console.log("✅ Scraped ESPN fixtures written to fixtures-output.html");
  } catch (err) {
    console.error("❌ Failed to scrape ESPN:", err.message);
  }
})();
