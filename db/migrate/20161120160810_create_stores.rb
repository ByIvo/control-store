class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.integer :quantity
      t.belongs_to :product, foreign_key: true
      t.boolean :isSale
      t.timestamp :movementDate

      t.timestamps
    end
  end
end
