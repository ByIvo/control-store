class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.belongs_to :seller, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.timestamp :saleDate

      t.timestamps
    end
  end
end
