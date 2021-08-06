class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :birthday, presence: true

  validates :first_name_kana, presence: true,
    format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい"
    }

  validates :last_name_kana, presence: true,
    format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい"
    }

    validates :first_name, presence: true,
    format: {
      with: /\A[一-龥]+\z/,
      message: "漢字のみで入力して下さい"
    }

    validates :last_name, presence: true,
    format: {
      with: /\A[一-龥]+\z/,
      message: "漢字のみで入力して下さい"
    }

end
