class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.text :prescript
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
