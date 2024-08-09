class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.integer :amount
      t.string :type
      t.string :category
      t.integer :cash_balance
      t.integer :credit_balance
      t.integer :total

      t.timestamps null: false
    end
  end
end
