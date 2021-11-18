class ProfileSitter < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
