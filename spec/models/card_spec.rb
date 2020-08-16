require 'rails_helper'
describe Card do
  describe '#create' do
    it "user_id,customer_id, card_idがあれば登録出来ること" do
      card = build(:card)
      expect(card).to be_valid
    end

    it "user_idがなければ登録できないこと" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user]).to include()
    end

    it "card_idがなければ登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card]).to include()
    end

    it "customer_idがなければ登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer]).to include()
    end

  end
end
