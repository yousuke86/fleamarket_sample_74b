FactoryBot.define do

  factory :item do
    name    {"鉛筆"}
    price   {"500"}
    introduction   {"これは鉛筆です。"}
    status_id   {1}
    postage_type_id   {1}
    prefecture_id   {1}
    need_day_id   {1}
    # brand_name   {"コクヨ"}
    # buyer_id   {1}
    seller_id   {1}
    
    images  { [build(:image)] }
    
  end

end