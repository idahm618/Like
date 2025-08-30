const fetch = require('node-fetch');

async function testESPN() {
  const url = 'https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard';
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const data = await res.json();
    console.log('ESPN Premier League Scoreboard:', Object.keys(data).length, 'keys');
  } catch (e) {
    console.error('ESPN error:', e.message);
  }
}

async function testSofaScore() {
  const url = 'https://prod.sofascore.com/api/v1/sport/football/scheduled-events/2025-08-08';
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const data = await res.json();
    console.log('SofaScore Scheduled Events count:', data.events ? data.events.length : 'no events');
  } catch (e) {
    console.error('SofaScore error:', e.message);
  }
}

async function testLivescore() {
  const url = 'https://prod-public-api.livescore.com/v1/api/app/date/soccer/2025-08-08';
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const data = await res.json();
    console.log('Livescore Matches count:', data.Stages ? data.Stages.length : 'no stages');
  } catch (e) {
    console.error('Livescore error:', e.message);
  }
}

async function testUnderstat() {
  const url = 'https://understat.com/match/12345'; // example match page (scraping needed)
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const text = await res.text();
    if (text.includes('window.__INITIAL_DATA__')) {
      console.log('Understat page fetched, contains data.');
    } else {
      console.log('Understat page fetched, no data found.');
    }
  } catch (e) {
    console.error('Understat error:', e.message);
  }
}

async function testFlashScore() {
  // Note: Match ID must be replaced with a real one, example below uses dummy 1234567
  const url = 'https://d.flashscore.com/x/feed/f_1_1234567_1_en.json';
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    if (res.status === 200) {
      const data = await res.json();
      console.log('FlashScore data keys:', Object.keys(data));
    } else {
      console.log('FlashScore fetch status:', res.status);
    }
  } catch (e) {
    console.error('FlashScore error:', e.message);
  }
}

async function runTests() {
  console.log('--- Testing unofficial football APIs ---');
  await testESPN();
  await testSofaScore();
  await testLivescore();
  await testUnderstat();
  await testFlashScore();
  console.log('--- Tests finished ---');
}

runTests();
