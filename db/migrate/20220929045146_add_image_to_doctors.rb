class AddImageToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :image, :string, null: false
  end
end
