class CreateInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :ident
      t.string :model
      t.string :maker
      t.string :inst_type
      
      t.timestamps
    end
  end
end
