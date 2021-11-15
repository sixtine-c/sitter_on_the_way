class CreateProfileSitters < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_sitters do |t|
      t.text :description
      t.string :addess
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.string :dates

      t.timestamps
    end
  end
end
