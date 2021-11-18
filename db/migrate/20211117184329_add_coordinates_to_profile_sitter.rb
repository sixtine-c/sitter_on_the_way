class AddCoordinatesToProfileSitter < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_sitters, :latitude, :float
    add_column :profile_sitters, :longitude, :float
  end
end
