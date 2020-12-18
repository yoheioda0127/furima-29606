FactoryBot.define do
  factory :address_information do
    token { "JfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDdz09IiwiZXhwIjpudWxsLCJwdXIi" }
    post_num { "205-5544" }
    pref_id { 3 }
    city { "千葉市" }
    house_num { "青山3-4" }
    building { "グリーンプラザ105" }
    tel { "09027310013" }
  end
end
