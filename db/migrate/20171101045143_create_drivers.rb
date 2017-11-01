class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.integer :age
      t.string :race

      t.timestamps
    end
  end
end
