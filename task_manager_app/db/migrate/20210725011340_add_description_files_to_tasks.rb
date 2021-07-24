class AddDescriptionFilesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description_files, :json
  end
end
