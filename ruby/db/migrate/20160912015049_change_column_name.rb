class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :transactions, :type, :type_of_transaction
  end
end
