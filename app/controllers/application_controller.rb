class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Shop.ransack(params[:q])#ransackメソッド推奨
    @search_shop = @search.result.includes(:areas, :addresses, :details, :recommends, :shop_recommends, :features, :shop_features)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ 
      :name,
      :telNumber,
      :description,
      :agreement,
      [:addresses_attributes => [:zipcode, :street, :station, :prefecture, :city_id, :area_id,:full_address, :latitude, :longitude]], 
      {:area_ids => []},
      {:city_ids => []},
      {:recommend_ids => []},
      {:feature_ids => []}
     ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  #  def search_params
  #    params.require(:q).permit({:areas_id_in => []}, {:recommends_id_in => []})
  #  end

end
