class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :profile_sitter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
