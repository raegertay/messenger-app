$(document).on('turbolinks:load', function() {
  App.cable.subscriptions.create( { channel: 'AppearanceChannel' }, {
    received: function(data) {
      if (data.type === 'appear') {
        $(`#user_${data.user_id}`).addClass('text-success')
      } else {
        $(`#user_${data.user_id}`).removeClass('text-success')
      }
    }
  })
})