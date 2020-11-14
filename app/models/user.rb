class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :informatioms

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください！！' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ンー-]+\z/, message: '全角カタカナを使用してください！！' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with: /[@]/, message: '@を使用してください！！' } do
    validates :email, presence: true
  end
  
  with_options presence: true, presence: true, length: { minimum: 6 }, format: { with: /[a-z]\d/, message: '半角英数字を使用してください！！' } do
    validates :encrypted_password, presence: true, length: { minimum: 6 }
  end

  #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  
  validates :nickname, presence: true
  validates :birthday, presence: true
end
