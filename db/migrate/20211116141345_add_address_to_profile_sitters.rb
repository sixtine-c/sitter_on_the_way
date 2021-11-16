class AddAddressToProfileSitters < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_sitters, :address, :string
  end
end
