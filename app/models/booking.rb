class Booking < ApplicationRecord
  belongs_to :ProfileSitter
  belongs_to :User
end
