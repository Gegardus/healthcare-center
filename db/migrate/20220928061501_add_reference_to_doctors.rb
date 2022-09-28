class AddReferenceToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctors, :category, foreign_key: true
  end
end
