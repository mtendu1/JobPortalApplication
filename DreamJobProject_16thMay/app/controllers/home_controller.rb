class HomeController < ApplicationController
  def index

    #user = User.find_by(email_id: params[:email_id])

    if user_signed_in?
      utype = current_user.userType

          if utype=="Employer"
          redirect_to :controller => 'employers', :action => 'index'

      else
          redirect_to :controller => 'jobseekers', :action => 'index'
      end

    end
  end
end
