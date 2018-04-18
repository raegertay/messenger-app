if (conversationChannel !== null) {
  conversationChannel.unsubscribe()
  console.log('Unsubscribed')
}

if ($('#conversation_id').val()) {
  console.log('Subscribe to conversation_' + $('#conversation_id').val())
  conversationChannel = App.cable.subscriptions.create( { channel: 'ConversationChannel', conversation_id: $('#conversation_id').val() }, {
    received: function(message) {
      console.log(message)
      $(".messages").append(`<p><b>${message.username}</b>: ${message.content}</p>`)
      document.querySelector('form').reset()
    }
  })
}
