class Item < ApplicationRecord
    belongs_to :user

    has_one_attached :image

    validates :content, presence: true, unless: :was_attached?

    def was_attached?
      self.image.attached?
    end


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
    belongs_to :category 
    belongs_to :condition
    belongs_to :load 
    belongs_to :days 

    validates :price, numericality: { only_integer: true,
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9_999_999 }

    with_options presence: true do
    validates :name
    validates :price
    validates :explanation
    validates :image

    with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :area_id
    validates :category_id
    validates :condition_id
    validates :days_id
    validates :load_id
    end
    end
end