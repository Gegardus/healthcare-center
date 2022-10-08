class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.belongs_to :doctor, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
