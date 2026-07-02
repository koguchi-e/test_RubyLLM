class AddSituationToTasks < ActiveRecord::Migration[8.1]
  def change
    add_reference :tasks, :situation, null: false, foreign_key: true
  end
end
