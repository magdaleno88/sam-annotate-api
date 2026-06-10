class CreateAnnotations < ActiveRecord::Migration[8.1]
  def change
    create_table :annotations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.references :classification_class, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
