class Admins::ApplicationController < ActionController::Base
  before_action :set_admin
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    admin_root(current_admin)
  end
  
private
    def sign_in_required
        redirect_to new_admin_session_url unless admin_signed_in?
    end

    def set_admin
      Admin.find_by(id: session[:admin_session])
  end
end
