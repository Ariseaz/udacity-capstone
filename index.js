var express = require('express');
var app = express();

app.use(express.static(__dirname + '/static'));
app.set('views', __dirname + '/static/views');
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.get('/index.html', function (req, res) {
  res.render('./static/index.html');
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
