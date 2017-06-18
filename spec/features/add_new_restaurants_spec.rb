require 'rails_helper'

RSpec.feature "AddNewRestaurants", type: :feature do
  it "should require the user log in before adding an article" do
    password = '123456'
    user = create(:user, password: password, password_confirmation: password)

    visit new_restaurant_path

    within "#new_user" do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end

    click_button "Log in"
  end
end
