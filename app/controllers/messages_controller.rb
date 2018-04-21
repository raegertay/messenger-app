class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = current_user.messages.create(message_params)
    conversation = message.conversation
    ActionCable.server.broadcast("conversation_#{conversation.id}", {
      content: message.content,
      username: current_user.username
    })
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end
end
