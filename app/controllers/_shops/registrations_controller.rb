# frozen_string_literal: true

class Shops::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:profile_update]
  before_action :authenticate_scope!, only: [:profile_edit, :edit]
  layout "users", only: [:profile_edit, :edit]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  def profile_edit
 
  end
 
  def profile_update
  
  end

   # current_shop.assign_attributes(configure_permitted_parameters)
   # if current_shop.save
	 # redirect_to mypages_shop_url(current_shop.id), notice: 'プロフィールを更新しました'
   # else
   #   render "profile_edit"
   # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys:[ :name, :telNumber, :description, {:recommend_ids => []}, {:feature_ids => []}])
  #end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  #def authenticate_scope!
  #  send(:authenticate_shop!, force: true)
  #  self.resource = send(:"current_shop")
  #end

  #def update_with_password(params, * options)
  #  if params[:password].blank?
  #  params.delete(:password)
  # params.delete(:password_confirmation) if params[:password_confirmation].blank?
  # end
  #  update_attributes(params, * options)
  # end

end
