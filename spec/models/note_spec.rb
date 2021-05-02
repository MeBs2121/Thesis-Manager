require 'rails_helper'

RSpec.describe Note, type: :model do

  describe 'Create note' do

    let(:note) { create(:note) }

    context 'valid note' do
      it "is valid with valid values" do
        expect(note).to be_valid
      end
    end

    context 'invalid note' do
      it "is invalid without title" do
        note.title = nil
        note.valid?
        expect(note.errors[:title]).to include("can't be blank")
      end
    end
  end #Create note

  describe 'Association' do

    let(:note) { create(:note) }

    context 'has category' do
      it "has category" do
        expect(note.categories.count).to eq 1
      end
    end

  end #Association

end
