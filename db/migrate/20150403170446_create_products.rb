class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, uniqueness: true
      t.text :description

      t.timestamps null: false
    end
  end
end
