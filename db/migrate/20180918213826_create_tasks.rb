class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :item
      t.string :description
      t.string :completion_date

      t.timestamps
    end
  end
end
