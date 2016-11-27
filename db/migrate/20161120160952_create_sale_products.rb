class CreateSaleProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_products do |t|
      t.belongs_to :sale, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.decimal :price
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
