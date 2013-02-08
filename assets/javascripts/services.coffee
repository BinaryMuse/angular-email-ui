app = require './application.coffee'

app.factory 'navigation', ($location) ->
  to: (url) ->
    console.log "WOOO", url
    $location.url url
  unreadIn: (label) ->
    switch label
      when 'inbox' then 14
      when 'sent' then 0
      when 'trash' then 0
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
