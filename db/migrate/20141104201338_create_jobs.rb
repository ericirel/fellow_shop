class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :skills
      t.text :description
      t.float :budget

      t.timestamps
    end
  end
end
