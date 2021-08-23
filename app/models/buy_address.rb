class BuyAddress < ApplicationRecord
  attr_accessor :token
  belongs_to :purchase


end
