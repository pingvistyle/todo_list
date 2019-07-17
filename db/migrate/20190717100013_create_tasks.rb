class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.boolean :completed
      t.date :due_date
      t.timestamps
    end
  end
end
