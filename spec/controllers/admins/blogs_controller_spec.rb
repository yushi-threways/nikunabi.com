require 'rails_helper'

RSpec.describe Admins::BlogsController, :type => :controller do
  let(:params_hash) { attributes_for(:blog) }

  before do
    login_admin
  end
    
  describe '#index' do
    it "ログインできているか" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it 'newテンプレートが表示されているか' do
      expect(response.status).to eq 200
      expect(assigns(:blog)).to be_a_new(Blog)
      expect(response).to render_template :new
    end
  end

  describe "#create" do

    it 'saves new blog' do
      expect do
        post :create, params: { blog: params_hash }, session: {}
      end.to change(Blog, :count).by(1)
    end

    it 'redirects the :create template' do
      post :create, params: { blog: params_hash }
      blog = Blog.last
      expect(response).to redirect_to(admins_blog_url(blog))
    end

    it '例外ActionController::ParameterMissingが発生' do
      bypass_rescue # 例外処理を無効にする効果がある rescue_formと同様
      expect { post :create }.to raise_error(ActionController::ParameterMissing)
    end
  end
end