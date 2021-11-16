class RemoveAddessAndDatesFromProfileSitters < ActiveRecord::Migration[6.0]
  def change
    remove_column :profile_sitters, :addess, :string
    remove_column :profile_sitters, :dates, :string
  end
end
