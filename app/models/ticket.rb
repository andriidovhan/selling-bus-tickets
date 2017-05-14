class Ticket < ApplicationRecord
  belongs_to :timetable

  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :amount_of_place, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
