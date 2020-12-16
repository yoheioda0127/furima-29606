class AddressInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :pref_id, :city, :house_num, :building, :tel, :token
  
  with_options presence: true do
    validates :city
    validates :token
    validates :house_num
    validates :pref_id, numericality: { other_than: 1 } 
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :tel, numericality: { with: /\A\0\d{9,10}\z/ } 
  end

  def save
    information = Information.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, pref_id: pref_id, city: city, house_num: house_num, building: building, tel: tel, information_id: information.id)
  end
end