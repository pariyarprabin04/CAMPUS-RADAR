// Tiny static server. No npm install needed. Run: node server.js
const http = require("http"), fs = require("fs"), path = require("path");
const root = path.join(__dirname, "public"), port = process.env.PORT || 3000;
const types = { ".html": "text/html", ".css": "text/css", ".js": "text/javascript", ".json": "application/json", ".svg": "image/svg+xml" };
http.createServer((req, res) => {
  const url = decodeURIComponent(req.url.split("?")[0]);
  const file = path.normalize(path.join(root, url === "/" ? "index.html" : url));
  if (!file.startsWith(root)) { res.writeHead(403); return res.end("Forbidden"); }
  fs.readFile(file, (err, data) => {
    if (err) { res.writeHead(404); return res.end("Not found"); }
    res.writeHead(200, { "Content-Type": (types[path.extname(file)] || "text/plain") + "; charset=utf-8" });
    res.end(data);
  });
}).listen(port, () => console.log(`Campus Opportunity Radar: http://localhost:${port}`));
