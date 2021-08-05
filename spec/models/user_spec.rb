require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end

    it 'nickname:必須' do
      @user.nickname = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  end
end

