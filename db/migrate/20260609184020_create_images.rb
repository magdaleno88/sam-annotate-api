class CreateImages < ActiveRecord::Migration[8.1]
  def change
    create_table :images do |t|
      t.string :patient_code
      t.string :status

      t.timestamps
    end
  end
end
