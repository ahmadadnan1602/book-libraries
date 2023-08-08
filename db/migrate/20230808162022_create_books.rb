class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :library, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.boolean :available
      t.integer :user_id

      t.timestamps
    end
  end
end
