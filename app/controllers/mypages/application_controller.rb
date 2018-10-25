class Mypages::ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypages_shop(current_shop)
  end


  protected

  def configure_permitted_parameters
     added_attrs = [ :name, :telNumber, :city_id, :description, [:address_attributes => [:street, :zipcode, :building]], {:recommend_ids => []}, {:feature_ids => []} ]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end
end
