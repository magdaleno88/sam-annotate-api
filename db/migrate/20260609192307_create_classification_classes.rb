class CreateClassificationClasses < ActiveRecord::Migration[8.1]
  def change
    create_table :classification_classes do |t|
      t.string :name
      t.integer :severity

      t.timestamps
    end
  end
end
