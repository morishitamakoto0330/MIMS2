class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :e_name , :null => false
      t.string :e_key , :null => false
      t.text :e_detail
      t.string :e_host
      t.timestamps null: false
    end
  end
end
