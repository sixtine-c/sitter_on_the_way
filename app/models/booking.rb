class Booking < ApplicationRecord
  belongs_to :profile_sitter
  belongs_to :user
end
