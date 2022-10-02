class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.belongs_to :doctor
      t.string :name, default: 'physician'

      t.timestamps
    end
  end
end
