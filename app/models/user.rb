class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :informatioms

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください！！' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー-]+\z/, message: 'は全角カタカナを使用してください！！' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字を使用してください！！' }
  
end
