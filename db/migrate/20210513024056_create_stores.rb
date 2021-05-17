class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.string :code
      t.integer :article_amount
      t.references :article, null: true, foreign_key: true

      t.timestamps
    end
  end
end
