class AddHeadPhysicianToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :head_physician, :boolean
  end
end
