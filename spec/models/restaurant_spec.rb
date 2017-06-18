require 'rails_helper'

describe Restaurant, type: :model do

  describe "Restaurant validation" do

    before :each do
    @user = create(:user)
    end

    it "Should save it has a name, genre, phone, and address" do
      restaurant = Restaurant.new(name: "name", genre: "genre", phone: "1234567890", address: "123 Washington St, Boston, MA, 02210", user: @user)
      expect(restaurant.save!).to eq true
    end

    it "Should not save without a name" do
      restaurant = Restaurant.new(genre: "genre", phone: "1234567890", address: "123 Washington St, Boston, MA, 02210", user: @user)
      expect{restaurant.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Should not save with a short name" do
      restaurant = Restaurant.new(name: "n", genre: "genre", phone: "1234", address: "123 Washington St, Boston, MA, 02210", user: @user)
      expect{restaurant.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Should not save with a short phone number" do
      restaurant = Restaurant.new(name: "name", genre: "genre", phone: "1234", address: "123 Washington St, Boston, MA, 02210", user: @user)
      expect{restaurant.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end
