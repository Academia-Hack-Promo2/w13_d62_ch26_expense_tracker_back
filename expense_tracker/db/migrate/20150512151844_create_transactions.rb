class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.integer :t_type, limit: 1
      t.decimal :amount, scale: 2, precision: 11
      t.string :description, limit: 50

      t.timestamps null: false
    end
  end
end
