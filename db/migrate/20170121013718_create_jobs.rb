class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :inst_name 
      t.string :repair_type
      t.string :user_name
      t.text :comment
      
      t.timestamps
    end
  end
end
