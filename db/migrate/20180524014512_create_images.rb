class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :image_url
      t.string :alt

      t.timestamps
    end
  end
end
