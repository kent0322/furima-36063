require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
        @item = FactoryBot.build(:item)
      end

       context '商品出品ができる時' do
        it '全てのカラムに正常値があれば登録できる' do
          expect(@item).to be_valid
        end
       end
  
         context '商品出品ができない時' do

            it "商品画像を1枚つけることが必須であること。" do
                @item.image = nil 
                @item.valid?
                expect(@item.errors.full_messages).to include("Image can't be blank")
            end

            it "商品名が必須であること。" do
                @item.name = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Name can't be blank")
            end

            it "商品の説明が必須であること。" do
                @item.explanation = ""
                @item.valid?
                expect(@item.errors.full_messages).to include()
            end

            it "カテゴリーの情報が必須であること。" do
                @item.category_id = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Category can't be blank")
            end

            it "商品の状態の情報が必須であること。" do
                @item.condition_id = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Condition can't be blank")
            end

            it "配送料の負担の情報が必須であること。" do
                @item.load_id = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Load can't be blank")
            end

            it "発送元の地域の情報が必須であること。" do
                @item.area_id = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Area can't be blank")
            end

            it "発送までの日数の情報が必須であること。" do
                @item.days_id = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Days can't be blank")
            end

            it "価格の情報が必須であること。" do
                @item.price = ""
                @item.valid?
                expect(@item.errors.full_messages).to include("Price can't be blank")
            end

            it "価格は、¥300~¥9,999,999の間のみ保存可能であること。" do
                @item.price = 100
                @item.valid?
                expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
            end

            it "価格は半角数値のみ保存可能であること。" do
                @item.price = "１００００"
                @item.valid?
                expect(@item.errors.full_messages).to include("Price is not a number")
            end

            it "カテゴリーに「---」が選択されている場合は出品できない" do
                @item.category_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Category can't be blank")
            end
            it "商品の状態に「---」が選択されている場合は出品できない " do 
                @item.condition_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Condition can't be blank")
            end
            it "配送料の負担に「---」が選択されている場合は出品できない" do
                @item.load_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Load can't be blank")
            end
            it "発送元の地域に「---」が選択されている場合は出品できない" do
                @item.area_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Area can't be blank")
            end
            it "発送までの日数に「---」が選択されている場合は出品できない" do
                @item.days_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Days can't be blank")
            end
            it "半角英数混合では登録できないこと" do
                @item.price = "asdg"
                @item.valid?
                expect(@item.errors.full_messages).to include()
            end
            it "半角英語だけでは登録できないこと" do
                @item.price = 123
                @item.valid?
                expect(@item.errors.full_messages).to include()
            end
            it "価格が9_999_999円を超えると出品できない" do
                @item.price = 10000000
                @item.valid?
                expect(@item.errors.full_messages).to include()
            end
            it "userが紐付いていなければ出品できない" do
                @item.user_id = nil
                @item.valid?
                expect(@item.errors.full_messages).to include()
            end
        end
    end
