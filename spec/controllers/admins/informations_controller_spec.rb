require 'rails_helper'

RSpec.describe Admins::InformationsController, :type => :controller do
  let(:params_hash) { attributes_for(:information) }

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
      expect(assigns(:information)).to be_a_new(Information)
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    it 'saves new information' do
      expect do
        post :create, params: { information: params_hash }, session: {}
      end.to change(Information, :count).by(1)
    end

    it 'redirects the :create template' do
      post :create, params: { information: params_hash }
      expect(response).to redirect_to(admins_root_url)
    end
    
    it '例外ActionController::ParameterMissingが発生' do
      bypass_rescue # 例外処理を無効にする効果がある rescue_formと同様
      expect { post :create }.to raise_error(ActionController::ParameterMissing)
    end
  end

#   describe '#update' do
#     let(:information) { create(:information) }
#     let(:admin) { create(:admin) }
#     before do
#       login_admin
#     end
#     it 'titleの属性を変更する' do
#       params_hash.merge!(title: 'タイトルを変更しました。')
#       patch :update, id: information.id, params: { information: params_hash }
#       information.reload
#       expect(information.title).to eq('タイトルを変更しました。') 
#     end

#     example '例外ActionController::ParameterMissingが発生' do
#       bypass_rescue
#       expect { patch :update, id: information.id }.
#         to raise_error(ActionController::ParameterMissing)
#     end
#   end
end

