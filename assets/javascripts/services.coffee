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

app.factory 'messages', ->
  [
    {
      id: 1
      read: false
      starred: true
      selected: false
      from: {
        name: 'Brandon Tilley'
        email: 'brandon@brandontilley.com'
      }
      subject: 'Here\'s an email!'
      body: "This is a test. This is only a test. Had this been a real email, it would probably have been spam. Here is some more text to make it not fit."
      sent: new Date()
    }
  ]
