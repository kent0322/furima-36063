require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
     context 'ユーザ新規登録ができる時' do
      it '全てのカラムに正常値があれば登録できる' do
        expect(@user).to be_valid
      end
     end
     

    context 'ユーザ新規登録ができない時' do
      
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      

      it "メールアドレスが一意性であること。" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
     it "メールアドレスは、@を含む必要があること。" do
       @user.email = "test.com"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
     it "パスワードが必須であること。" do
       @user.password = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = 'A'
        @user.valid?
       expect(@user.errors.full_messages).to include( "Password は半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
  
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "123456"
        @user.valid?
       expect(@user.errors.full_messages).to include("Password は半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります")
      end
  
     it "お名前(全角)は、名字必須であること。" do
       @user.first_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
     it "お名前(全角)は、名前が必須であること。" do
       @user.last_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
     it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。" do
       @user.first_name = "a1"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
  
     it "お名前カナ(全角)は、名前が必須であること。" do
       @user.first_name_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
     it "名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。" do
       @user.last_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
       it "名字カナ(全角)は、名字が必須であること。" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
       end
  
       it "名字カナ(全角)は、名字と名前がそれぞれ必須であること。" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
       end
  
     it "生年月日が必須であること" do
       @user.birthday = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
 end

