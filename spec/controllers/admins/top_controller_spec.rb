require 'rails_helper'

RSpec.describe Admins::TopController, :type => :controller do
  describe '#index' do
    it "ログインできているか" do
      login_admin
      get :index
      expect(response).to have_http_status(200)
    end

    it "未ログインの場合" do
      get :index
      expect(response).to redirect_to(new_admin_session_url)
    end
  end
end