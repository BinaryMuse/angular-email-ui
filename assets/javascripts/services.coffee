app = require './application.coffee'

app.factory 'navigation', ($location, messages) ->
  to: (url) ->
    $location.url url
  unreadIn: (label) ->
    msgs = messages.in(label).filter (msg) -> !msg.read
    msgs.length
  current: ''
  pages: [
    {
      href: '/inbox'
      name: 'inbox'
      label: 'Inbox'
    }
    {
      href: '/starred'
      name: 'starred'
      label: 'Starred'
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
  messages = [
    {
      id: 1
      read: false
      starred: true
      selected: false
      sentLocally: false
      deleted: false
      from: {
        name: 'Brandon Tilley'
        email: 'brandon@brandontilley.com'
      }
      subject: 'Here\'s an email!'
      body: "This is a test. This is only a test. Had this been a real email, it would probably have been spam. Here is some more text to make it not fit."
      sent: new Date()
    }
  ]

  api =
    messages: messages
    findById: (id) ->
      for message in @messages
        return message if message.id.toString() == id.toString()
    in: (name) ->
      if name == 'trash'
        @messages.filter (msg) -> msg.deleted
      else
        messages = switch name
          when 'inbox'
            @messages.filter (msg) -> !msg.sentLocally
          when 'starred'
            @messages.filter (msg) -> msg.starred
          when 'sent'
            @messages.filter (msg) -> msg.sentLocally
          else
            []
        messages.filter (msg) -> !msg.deleted
