http = require 'http'
path = require 'path'
express = require 'express'
webpack = require 'webpack'
webpackDev = require 'webpack-dev-middleware'

process.env.NODE_ENV ?= 'development'

app = express()
server = http.createServer(app)

app.configure ->
  app.set 'port', process.env.PORT || '3000'
  app.set 'views', "#{__dirname}/views"
  app.use express.favicon()
  app.use express.logger()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.static("#{__dirname}/../public")

app.configure 'development', ->
  app.use webpackDev "#{__dirname}/../assets/index.js",
    webpack:
      watch: true
      publicPrefix: '/'
      output: '/bundle.js'
  app.use express.errorHandler()

server.listen app.get('port'), ->
  console.log "Server listening on http://localhost:#{app.get('port')}"

app.get '/*', (req, res) ->
  indexPage = path.resolve "#{__dirname}/../public/index.htm"
  res.sendfile indexPage
