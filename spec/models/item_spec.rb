require 'rails_helper'
describe Item do
  describe '#create' do
    it "name,price,introduction,status_id,postage_type_id,prefecture_id,need_day_id,imageがあれば登録出来ること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameがないと登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "nameが40文字を超えると登録出来ないこと" do
      item = build(:item, name: "あ" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "priceがないと登録出来ないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "priceが299以下だと登録出来ないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが10000000以上だと登録出来ないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "introductionがないと登録出来ないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it "introductionが1000文字を超えると登録出来ないこと" do
      item = build(:item, introduction: "あ" * 1001)
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end

    it "status_idがないと登録出来ないこと" do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "postage_type_idがないと登録出来ないこと" do
      item = build(:item, postage_type_id: nil)
      item.valid?
      expect(item.errors[:postage_type]).to include("を入力してください")
    end

    it "prefecture_idがないと登録出来ないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end

    it "need_day_idがないと登録出来ないこと" do
      item = build(:item, need_day_id: nil)
      item.valid?
      expect(item.errors[:need_day]).to include("を入力してください")
    end

    it "imageがないと登録出来ないこと" do
      item = Item.new(name: "テスト", price: "500", introduction: "テスト",status_id: "1", postage_type_id: "1", prefecture_id: "1", need_day_id: "1", seller_id: "1")
      item.valid?
      expect(item.errors[:images]).to include("を入力してください")
    end

  end
end