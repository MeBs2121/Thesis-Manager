class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.boolean :main
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
