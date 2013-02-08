app = require './application.coffee'

app.factory 'navigation', ($location) ->
  to: (url) ->
    console.log "WOOO", url
    $location.url url
  current: ''
  pages: [
    {
      href: '/inbox'
      name: 'inbox'
      label: 'Inbox'
    }
    {
      href: '/sent'
      name: 'sent'
      label: 'Sent'
    }
    {
      href: '/trash'
      name: 'trash'
      label: 'Trash'
    }
  ]
