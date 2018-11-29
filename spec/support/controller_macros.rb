module ControllerMacros
  def login_shop
      @request.env["devise.mapping"] = Devise.mappings[:shop]
      shop = FactoryBot.create(:shop) # Using factory bot as an example
      shop.confirm!
      sign_in shop
  end

  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = create(:admin)
    sign_in admin
  end
end