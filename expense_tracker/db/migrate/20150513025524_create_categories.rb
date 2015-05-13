class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_title

      t.timestamps null: false
    end
  end
end
