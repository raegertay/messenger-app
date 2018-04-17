class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'appearance'
    current_user.appear
    broadcast_appearance('appear')
  end

  def unsubscribed
    current_user.disappear
    broadcast_appearance('disappear')
  end

  private

  def broadcast_appearance(type)
    ActionCable.server.broadcast('appearance', {
      user_id: current_user.id,
      type: type
    }) 
  end
end