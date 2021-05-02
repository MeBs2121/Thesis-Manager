require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Create book' do
    # before do
    #   @book = create(:book)
    # end

    let(:book) { create(:book) }

    context 'valid book' do
      it "is valid with valid values" do
        expect(book).to be_valid
        # expect(book.user_id).to eq 1
      end
    end

    context 'invalid book' do
      it "is invalid without author" do
        # book = @book
        book.author = nil
        book.valid?
        expect(book.errors[:author]).to include("can't be blank")
      end

      it "is invalid without user_id" do
        book.user_id = nil
        book.valid?
        expect(book).to_not be_valid
      end
    end
  end
end
