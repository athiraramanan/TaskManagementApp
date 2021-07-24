class AddFileNameToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :task_file, :string
  end
end
