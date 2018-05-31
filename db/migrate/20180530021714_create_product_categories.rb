class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :category_id
      t.integer :product_id

      t.timestamps
    end
  end
end
