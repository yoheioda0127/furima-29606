require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの保存' do

    context "itemが保存できる場合" do
      it "item_name、detail、category_id、condition_id、ship_cost_id、ship_pref_id、ship_day_id、priceがあればitemは保存される" do
        expect(@item).to be_valid
      end
    end

    context "itemが保存できない場合" do
      it "item_nameがないとitemは保存できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name は必須内容です！！")
      end
      it "detailがないとitemは保存できない" do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail は必須内容です！！")
      end
      it "category_idがないとitemは保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category の選択を行ってください！！")
      end
      it "condition_idがないとitemは保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition の選択を行ってください！！")
      end
      it "ship_cost_idがないとitemは保存できない" do
        @item.ship_cost_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost の選択を行ってください！！")
      end
      it "ship_pref_idがないとitemは保存できない" do
        @item.ship_pref_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship pref の選択を行ってください！！")
      end
      it "ship_day_idがないとitemは保存できない" do
        @item.ship_day_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day の選択を行ってください！！")
      end
      it "priceがないとitemは保存できない" do
        @item.price = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円以下では保存できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end