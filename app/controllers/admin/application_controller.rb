# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

   def authenticate_admin
      # TODO Add authentication logic here.
      redirect_to root_url, alert: "Sorry You do not have enought privilege" unless current_doctor.try(:head_physician)
   end

    # def scoped_resource
    #   if current_doctor.head_physician?
    #     Doctor, Category, Appointment, Prescription, User
    #   else
    #     Appointment, Prescription
    #   end
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
