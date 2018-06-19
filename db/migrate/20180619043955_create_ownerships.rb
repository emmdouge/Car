class CreateOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships do |t|
      t.references :person
      t.references :automobile
      t.boolean :own
      t.timestamps
    end
  end
end
