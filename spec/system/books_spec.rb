require 'rails_helper'

RSpec.describe "Books", type: :system do

  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe 'user must login' do

    context 'if user not logged in' do
      it "redirects to the public page" do
        visit new_book_path
        expect(current_path).to eq user_session_path
      end
    end

    context 'if user logged in' do
      it "show new page" do
        sign_in user
        visit new_book_path
        expect(page).to have_content("Add a New Book")
      end
    end

  end #user must login

  describe 'create a book' do

    before do
      sign_in user
      visit new_book_path
    end

    context 'fails to create with invalid values'do
      it "fails without the title" do
        fill_in "Title", with: ""
        fill_in "Author", with: "togashi"
        check "メイン"

        click_on("Submit")
        expect(page).to have_content("Title can't be blank")
      end
    end

    context 'create a book successfully' do

      it "shows success message" do
        fill_in "Title", with: "Test book"
        fill_in "Author", with: "Test man"
        check "メイン"
        expect{
          click_on "Submit"
          expect(page).to have_content("Created a new Book")
        }.to change{ Book.count }.by(1)
      end

    end

  end #create a book

  describe 'delete a book' do
    before do
      sign_in user
      visit new_book_path
    end

    context 'delete a book successfully' do
      it "shows success message" do
        fill_in "Title", with: "Test book"
        fill_in "Author", with: "Test man"
        check "メイン"
        click_on "Submit"
        click_on "Delete"
        # expect(page.accept_confirm).to eq "Are you sure?"
        # expect(page).to have_content 'Deleted Book'
        expect {
                expect(page.accept_confirm).to eq "Are you sure?" #ボックスの確認とokを同時に
                expect(page).to have_content 'Deleted Book'
              }.to change{ Book.count }.by(-1)
      end
    end

  end #delete a book


end
