class CreateAutomobiles < ActiveRecord::Migration[5.1]
  def change
    create_table :automobiles do |t|
      t.string :model
      t.string :make
      t.string :color
      t.integer :mileage
      t.boolean :forsale
    end
  end
end
