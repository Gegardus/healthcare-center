class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!
  def index
    @admin_user = current_admin_user.id
  end

  def show   
    @admin_user = AdminUser.where(id: current_admin_user.id)
  end
end
