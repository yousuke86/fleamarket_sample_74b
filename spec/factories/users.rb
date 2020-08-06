FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"たなか"}
    first_name            {"よしお"}
    last_name_kana        {"たなか"}
    first_name_kana       {"よしお"}
    birth_day             {"1994-01-12"}
  end
end