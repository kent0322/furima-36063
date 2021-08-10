class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
         validates :password, presence: true,
                   format: { with: VALID_PASSWORD_REGEX,
                    message: "は半角6~12文字英小文字・数字それぞれ１文字以上含む必要があります"}

with_options presence: true do
  validates :nickname, length: { maximum: 20 }
  validates :birthday

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角ひらがな、全角カタカナ、漢字で入力して下さい"} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナで入力して下さい"  }do
    validates :last_name_kana
    validates :first_name_kana
  end
end
end
