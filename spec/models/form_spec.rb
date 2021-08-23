require 'rails_helper'

 RSpec.describe Form, type: :model do
   before do
     @user = FactoryBot.create(:user)
     @seller = FactoryBot.create(:user)
     @item = FactoryBot.create(:item, user_id: @seller.id)
     #binding.pry
     @form = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)
     sleep 0.1
    end 

  context '商品購入ができる時' do
    it "すべでのカラムに正常値があれば登録できる" do
      expect(@form).to be_valid
    end
  end

   context '商品購入ができない時'do
    it "郵便番号が必須であること" do
      @form.post = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Post can't be blank")
    end 

    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      @form.post = "１２４"
      @form.valid?
      expect(@form.errors.full_messages).to include("Post 「3桁ハイフン4桁」の半角文字列のみ")
    end

    it "都道府県が必須であること。"do
      @form.area_id = 1
      @form.valid?
      expect(@form.errors.full_messages).to include("Area can't be blank")
  end

      it "市区町村が必須であること。" do
        @form.city = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it "番地が必須であること。" do
        @form.address = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が必須であること。" do
        @form.telephone = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone can't be blank")
      end

      it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
        @form.telephone = 12345
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone 10桁以上11桁以内の半角数値のみ")
      end
      
        it "tokenが空では登録できないこと" do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end
      end
end



