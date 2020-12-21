class Information < ApplicationRecord
  has_one :address
  has_one :pref
  belongs_to :user
  belongs_to :item
end
