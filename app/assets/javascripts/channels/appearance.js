$(document).on('turbolinks:load', function() {
  App.cable.subscriptions.create( { channel: 'AppearanceChannel' }, {
    received: function(data) {
      if (data.type === 'appear') {
        $(`#user_${data.user_id} svg`).css('visibility', 'visible')
        $(`.conversation-user-${data.user_id} .online-indicator`).css('visibility', 'visible')
      } else {
        $(`#user_${data.user_id} svg`).css('visibility', 'hidden')
        $(`.conversation-user-${data.user_id} .online-indicator`).css('visibility', 'hidden')
      }
    }
  })
})