class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, default: 'physician'

      t.timestamps
    end
    add_index :categories, :name
  end
end
