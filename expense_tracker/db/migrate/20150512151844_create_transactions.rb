class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.integer :t_type, limit: 1
      t.float :amount
      t.string :description, limit: 50
      t.references :category, index: true, foreign_key:true
      t.timestamps null: false
    end
  end
end
