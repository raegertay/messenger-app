if (conversationChannel !== null) {
  conversationChannel.unsubscribe()
  console.log('Unsubscribed')
}

if ($('#conversation_id').val()) {
  console.log('Subscribe to conversation_' + $('#conversation_id').val())
  conversationChannel = App.cable.subscriptions.create( { channel: 'ConversationChannel', conversation_id: $('#conversation_id').val() }, {
    received: function(data) {
      const message = $(`<span>${data.content}</span>`)
      message.addClass('message')
      const username = $('.username').text()
      data.username === username ? message.addClass('other-user-message') : message.addClass('current-user-message')
      $(".messages").append(message)
      document.querySelector('form').reset()
    }
  })
}
