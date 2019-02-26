class Shops::ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_shop!
  before_action :set_shop

  def after_sign_in_path_for(resource)
    shops_root_path
  end

  protected

  def configure_permitted_parameters
     added_attrs = [ 
       :name,
       :telNumber,
       :description,
       [:address_attributes => [:area_id, :zipcode, :street, :station, :prefecture, :city_id, :full_address, :latitude, :longitude]], 
       {:area_ids => []},
       {:city_ids => []},
       {:recommend_ids => []},
      ]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end

   def set_shop
    Shop.find_by(id: session[:shop_session])
   end
end
