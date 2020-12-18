require 'rails_helper'

RSpec.describe AddressInformation, type: :model do
  describe '購入情報の入力' do
    before do
      @address_information = FactoryBot.build(:address_information)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_information).to be_valid
    end
    it 'buildingが空でも保存できること' do
      expect(@address_information).to be_valid
    end


    it 'post_numが空だと保存できないこと' do
      @address_information.post_num = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Post num can't be blank")
    end
    it 'pref_idが空だと保存できないこと' do
      @address_information.pref_id = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Pref can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @address_information.city = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numが空だと保存できないこと' do
      @address_information.house_num = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("House num can't be blank")
    end
    it 'telが空だと保存できないこと' do
      @address_information.tel = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Tel can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @address_information.token = nil
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numにハイフンがないと保存できないこと' do
      @address_information.post_num = "2994444"
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Post num is invalid")
    end
    it 'telはハイフンが不要で、存在すると保存できないこと' do
      @address_information.tel = "090-1122-4584"
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Tel is invalid")
    end
    it 'telは12桁では保存できないこと' do
      @address_information.tel = "090112245845"
      @address_information.valid?
      expect(@address_information.errors.full_messages).to include("Tel is invalid")
    end
  end
end