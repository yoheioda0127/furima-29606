class AddressInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :pref_id, :city, :house_num, :building, :tel
  
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :user_id
    validates :item_id
    validates :pref_id
  end

  with_options presence: true do
    validates :post_num,   numericality: { other_than: 0, message: "can't be blank" }
    validates :house_num,  numericality: { other_than: 0, message: "can't be blank" }
    validates :tel,        numericality: { other_than: 0, message: "can't be blank" },inclusion: {in: 0000000000..99999999999 } 
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters." } do
    validates :city
    validates :building
  end

  def save
    # 住所情報を保存
    Address.create(post_num: post_num, pref_id: pref_id, city: city, house_num: house_num, building: building, tel: tel, user_id: user.id)
    # 登録情報を保存(user&item定義必要？？？)
    Information.create(user_id: user.id, item_id: item.id)
  end
end