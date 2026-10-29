# Campus Opportunity Radar

A demo app where opportunities come from student social media groups. A developer reviews each post and publishes it. Students see only published opportunities.

## Run it in VS Code

1. Open this folder in VS Code (File > Open Folder).
2. Pick one:
   - **Live Server:** install the Live Server extension, right-click `public/index.html`, choose Open with Live Server.
   - **Node:** open the terminal and run `node server.js`, then visit http://localhost:3000. Needs Node 16 or newer. No `npm install` needed.

## Demo sign-in

Password for both accounts: `radar2026`

| Role | Email |
|---|---|
| Student (user) | jiyoung.cho6@campus.demo |
| Developer (admin) | hyunwoo.park1@campus.demo |

## Folder guide

| Path | What it is |
|---|---|
| `public/index.html` | Page structure |
| `public/styles.css` | All styling, light and dark mode |
| `public/app.js` | App logic, sample listings, group posts, 50 people |
| `database/campus_radar.sql` | MySQL schema and 50 people (see below) |
| `server.js` | Tiny static file server |

## MySQL

Run `mysql -u root -p < database/campus_radar.sql`, then `SELECT COUNT(*) FROM people;` should return 50. Tables: `people`, `accounts`, `sources`, `social_posts`, `opportunities`.

## Important limits

- This is a **demo**. Sign-in, roles and data live in the browser (`app.js`). Anyone can change them.
- The app does not talk to MySQL yet. The next step is a backend (for example Node with Express, or Python with FastAPI) that checks the `accounts` table, enforces roles on every request, and serves opportunities.
- Demo passwords use plain SHA-256 in the SQL file. Use bcrypt or argon2 in a real backend.
- Group posts are samples. Telegram and Discord can be read with a bot added by the group admin. Facebook groups, Instagram, KakaoTalk and Band have no general way to read other people's posts, so admins should forward or paste them. Do not scrape groups, and store only post text and a link, never member names.
