class Form 
  include ActiveModel::Model
  attr_accessor :post, :area_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post
    validates :city
    validates :address
    validates :telephone
    validates :user_id
    validates :item_id
    validates :token
  end
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :area_id
  end

  with_options format: {with: /\A\d{3}[-]\d{4}\z/, message: "「3桁ハイフン4桁」の半角文字列のみ"} do
    validates :post
  end

  with_options format: {with: /\A\d{10,11}\z/, message: "10桁以上11桁以内の半角数値のみ"} do
    validates :telephone
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    BuyAddress.create(post: post, area_id: area_id, city: city, address: address, building: building, telephone: telephone, purchase_id: purchase.id)
  end

end



