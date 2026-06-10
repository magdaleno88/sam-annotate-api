class CreateTaskImages < ActiveRecord::Migration[8.1]
  def change
    create_table :task_images do |t|
      t.references :task, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
