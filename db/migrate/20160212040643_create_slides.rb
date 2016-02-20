class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.integer :likes
      t.references :pdf_file, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
