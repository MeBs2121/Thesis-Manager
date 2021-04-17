class AddPageToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :page, :integer
  end
end
