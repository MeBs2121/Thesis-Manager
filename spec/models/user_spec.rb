require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'sign up user' do
    # before do
    #   @user = create(:user)
    # end

    let(:user) { create(:user) }

    context 'with valid values' do
      it "is valid" do
        # user = @user
        expect(user).to be_valid
      end
    end #with valid values

    context 'with invalid values' do
      it "is invalid without username" do
        user.username =nil
        expect(user).to_not be_valid
      end

      it "is invalid without email" do
        user.email = nil
        expect(user).to_not be_valid
      end

      it "is invalid with username that is too long" do
        user.username = "aaaaaaaaaaaaaaaaaaaaa"
        user.valid?
        expect(user.errors[:username]).to include("is too long (maximum is 15 characters)")
      end

      it "is invalid with username that is too short" do
        user.username = "a"
        user.valid?
        expect(user.errors[:username]).to include("is too short (minimum is 2 characters)")
      end

      it "is invalid with existed email" do
        user
        another_user = User.new(
          username: "another",
          email: "test@test.com",
          password: "password"
        )
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
        # expect(another_user).to be_valid
      end

    end #with invalid values

  end
end
