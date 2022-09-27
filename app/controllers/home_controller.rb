class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_doctor!

  def index
  end
end
