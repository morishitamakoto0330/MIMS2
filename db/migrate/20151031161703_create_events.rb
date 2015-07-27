class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: false do |t|
      t.string :e_name , :null => false
      t.string :e_key, :unique => true , :null => false
      t.text :e_detail
      t.string :e_host
      t.string :e_location
      t.timestamps null: false
    end
  end
end
