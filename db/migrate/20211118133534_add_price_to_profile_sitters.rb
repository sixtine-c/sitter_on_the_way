class AddPriceToProfileSitters < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_sitters, :price, :integer
  end
end
