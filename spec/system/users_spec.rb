require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe 'visit user_session_path' do
    before do
      visit root_path
      click_link "Log in"
    end

    it "visits user_session_path" do
      expect(current_path).to eq user_session_path
    end
  end

  describe 'Log in user' do
    before do
      @user = create(:user)
      visit root_path
      click_link "Log in"
    end

    it "visits user_session_path" do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_content("Signed in successfully.")
    end
  end

  describe 'Sign up user' do
    before do
      @user = build(:user)
      visit root_path
      click_link "Sign up"
    end

    it "visits user_session_path" do
      fill_in "Username", with: @user.username
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      fill_in "Password confirmation", with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end
end
