class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
