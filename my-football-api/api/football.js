export default async function handler(req, res) {
  const { type, league = "eng.1", team, eventId } = req.query;

  const fetchJSON = async url => {
    const r = await fetch(url);
    return r.ok ? r.json() : { error: "Failed to fetch" };
  };

  let data;

  if (type === "all") {
    data = await fetchJSON("https://site.api.espn.com/apis/site/v2/sports/soccer/scoreboard");
  } else if (type === "leagueMatches") {
    data = await fetchJSON(`https://site.api.espn.com/apis/site/v2/sports/soccer/${league}/scoreboard`);
  } else if (type === "standings") {
    data = await fetchJSON(`https://site.api.espn.com/apis/v2/sports/soccer/${league}/standings`);
  } else if (type === "teamSchedule") {
    data = await fetchJSON(`https://site.api.espn.com/apis/site/v2/sports/soccer/${league}/teams/${team}/schedule`);
  } else if (type === "eventSummary") {
    data = await fetchJSON(`https://site.api.espn.com/apis/site/v2/sports/soccer/summary?event=${eventId}`);
  } else {
    data = { error: "Unknown type" };
  }

  res.setHeader('Cache-Control', 's-maxage=60, stale-while-revalidate');
  res.status(200).json(data);
}
