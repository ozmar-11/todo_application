class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.string :task_name
      t.string :task_description
      t.datetime :task_due_date
      t.datetime :task_date_completed
      t.integer :task_status
      t.integer :task_user

      t.timestamps null: false
    end
  end
end
