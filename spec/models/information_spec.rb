require 'rails_helper'

RSpec.describe Information, :type => :model do
  describe 'バリデーションのテスト' do
    example 'titleが3文字以下は無効' do
      information = build(:information, title: 'ああ')
      expect(information).not_to be_valid
    end

    example 'titleが50文字以上は無効' do
      information = build(:information, title: Faker::Base.regexify("[aあ]{70}"))
      expect(information).not_to be_valid
    end
  end
end
