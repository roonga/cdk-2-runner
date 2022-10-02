const http = require("http");

http.createServer({}, function (req, res) {
    res.writeHead(200);
    res.end("ready");
}).listen(80, () => console.log("ready"));
