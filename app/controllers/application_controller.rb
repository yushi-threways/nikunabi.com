class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_search

  def set_search
    @shop = Shop.all
    @cities = City.all
    @recommends = Recommend.all
    @features = Feature.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result.includes(:city, :address, :details, :recommends, :shop_recommends, :features, :shop_features)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ 
      :name,
      :telNumber,
      :description,
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

   def search_params
     params.require(:q).permit({:city_id_in => []} ,{:recommends_id_eq_all => []}, {:features_id_eq_all => []}, {:rooms_id_eq_all => []}, {:scenes_id_eq_all => []})
   end

end
