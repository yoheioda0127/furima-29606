class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  belongs_to       :condition
  belongs_to       :ship_cost
  belongs_to       :ship_pref
  belongs_to       :ship_day
  belongs_to       :category
  has_one          :information
  has_one_attached :image

  with_options presence: {message: 'は必須内容です！！' } do
    validates :item_name
    validates :detail
  end
  

  with_options presence: true, numericality: { other_than: 1 ,message: 'の選択を行ってください！！'} do
    validates :condition_id
    validates :ship_cost_id
    validates :ship_pref_id
    validates :ship_day_id
    validates :category_id
  end

  validates   :price, presence: true, inclusion: {in: 300..9999999 } , format: { with: /[0-9]/, message: 'は¥300~¥9,999,999です！！' }

end