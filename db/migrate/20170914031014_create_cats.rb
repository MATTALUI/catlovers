class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.integer :age
      t.string :image_url
      t.boolean :shots

      t.timestamps
    end
  end
end
