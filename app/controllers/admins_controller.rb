class AdminsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @admin = current_admin.id
      end
end
