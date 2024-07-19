class AddCategoryToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :category, null: false, foreign_key: true
  end
end
