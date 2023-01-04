class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
