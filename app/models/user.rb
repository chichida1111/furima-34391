class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name_j
    validates :family_name_j
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :last_name_k
    validates :family_name_k
  end

  validates :nickname, presence: true
  validates :birthday, presence: true
end
