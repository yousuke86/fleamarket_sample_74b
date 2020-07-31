FactoryBot.define do
  factory :sending_destination do
    destination_last_name       {"やまだ"}
    destination_first_name      {"よしお"}
    destination_last_name_kana  {"やまだ"}
    destination_first_name_kana {"よしお"}
    post_code                   {"544-0031"}
    city                        {"大阪市"}
    house_number                {"2-2-21"}
    buildingname_and_roomnumber {"405"}
    tel                         {"08024045788"}
  end
end