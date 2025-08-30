const express = require('express');
const fetch = require('node-fetch');
const cors = require('cors');

const app = express();
app.use(cors());

const PORT = 5000;
const HOST = '0.0.0.0'; // So it's accessible on local network

// FotMob match data scraper
app.get('/api/matches', async (req, res) => {
  try {
    const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD
    const response = await fetch(`https://www.fotmob.com/api/matches?date=${today}`);
    const data = await response.json();

    const matches = [];

    for (const section of data.matches) {
      for (const match of section.matches) {
        matches.push({
          home: match.home.name,
          away: match.away.name,
          status: match.status.description,
          startTime: match.status.utcTime,
          score: match.status.scoreStr,
          id: match.id,
        });
      }
    }

    res.json(matches);
  } catch (error) {
    console.error('Error fetching FotMob data:', error);
    res.status(500).json({ error: 'Failed to fetch data' });
  }
});

app.listen(PORT, HOST, () => {
  console.log(`Server running on http://${HOST}:${PORT}`);
});
