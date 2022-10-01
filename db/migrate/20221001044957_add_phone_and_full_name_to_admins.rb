class AddPhoneAndFullNameToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :phone, :string
    add_column :admins, :full_name, :string
  end
end
