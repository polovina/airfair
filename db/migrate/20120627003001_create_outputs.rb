class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.integer :user_id
      t.string :start_date
      t.string :return_date
      t.string :departure
      t.string :arrival
      t.string :vendor
      t.string :url
      t.integer :price
      t.timestamps
     
    end
  end
end
