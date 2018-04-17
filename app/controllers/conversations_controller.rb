class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    @online_user_ids = $redis.smembers('appearance')
  end
end
