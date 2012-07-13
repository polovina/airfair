class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.integer :user_id
      t.string :start_date
      t.string :return_date
      t.string :departure
      t.string :arrival
      t.boolean :active
      t.integer :threshold
      t.timestamps
    end
  end
end
