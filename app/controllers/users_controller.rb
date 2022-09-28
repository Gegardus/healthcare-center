class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
   @user = current_user.id
  #  @users = User.all
  end

  def show 
    # @user = current_user.id
  end
end
