class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    # conversations = current_user.conversations
    # messages = Message.joins(:conversation).where(conversation: conversations).order(created_at: :desc)
    # users = User.joins(:messages).where(messages: {id: messages.ids}).order('messages.created_at DESC').uniq
    @online_user_ids = $redis.smembers('appearance')
  end
end
