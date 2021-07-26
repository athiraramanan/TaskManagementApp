class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.string :name
      t.string :code
      t.text :body
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.string :status


      t.timestamps
    end
  end
end