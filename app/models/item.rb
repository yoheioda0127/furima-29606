class Item < ApplicationRecord
  
  belongs_to  :user
  has_one     :information

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は必須内容です！！' } do
    validates :item_name
    validates :detail
  end

  with_options presence: true, format: { message: 'の選択を行ってください！！' } do
    validates :categoly_id
    validates :condition_id
    validates :ship_cost_id
    validates :ship_pref_id
    validates :ship_day_id
  end

  validates   :price, presence: true, inclusion: {in: 300..9999999 } , format: { message: 'は¥300~¥9,999,999です！！' }

end