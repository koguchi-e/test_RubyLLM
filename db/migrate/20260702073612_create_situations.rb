class CreateSituations < ActiveRecord::Migration[8.1]
  def change
    create_table :situations do |t|
      t.text :fact
      t.text :problem
      t.text :goal
      t.integer :status

      t.timestamps
    end
  end
end
