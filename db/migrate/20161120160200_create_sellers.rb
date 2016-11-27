class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.belongs_to :administrator, foreign_key: true

      t.timestamps
    end
  end
end
