FactoryBot.define do

  factory :image do
    image_url   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    item_id   {1}
  end

end