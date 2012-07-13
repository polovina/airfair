class AddIntervalToInputs < ActiveRecord::Migration
  def change
    add_column :inputs, :interval, :integer, :default=> 24
  end
end
