class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_other_user, only: [:show]
  before_action :set_conversation, only: [:show]

  def show
    @messages = @conversation.messages
  end

  private

  def set_other_user
    @other_user = User.find(params[:user_id])
  end

  def set_conversation
    @conversation = current_user.find_conversation(@other_user) || current_user.conversations.create
    @other_user.conversations << @conversation unless @conversation.users.include?(@other_user)
  end
end
