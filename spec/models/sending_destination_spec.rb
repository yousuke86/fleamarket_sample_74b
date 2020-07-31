require 'rails_helper'
describe SendingDestination do
  describe '#create' do
    it "destination_last_name、destination_first_name、destination_last_name_kana、destination_first_name_kana、post_code、prefecture_id、city,house_numberが存在すれば登録できること" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, user_id: user.id, prefecture_id: prefecture.id)
      expect(sending_destination).to be_valid
    end

    it "destination_last_nameがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, destination_last_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_last_name]).to include("を入力してください")
    end

    it "destination_first_nameがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, destination_first_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name]).to include("を入力してください")
    end

    it "destination_last_name_kanaがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, destination_last_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_last_name_kana]).to include("を入力してください")
    end

    it "destination_first_name_kanaがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, destination_first_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name_kana]).to include
    end

    it "post_codeがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, post_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, prefecture_id: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture_id]).to include
    end

    it "cityがない場合は登録できないこと" do
      user = User.create(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",last_name: '田中',first_name: '太郎',last_name_kana: 'タナカ', first_name_kana: 'タロウ', birth_day: '2000-12-25')
      prefecture = Prefecture.create(prefecture: "福島県")
      sending_destination = build(:sending_destination, city: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:city]).to include("を入力してください")
    end
  end
end


