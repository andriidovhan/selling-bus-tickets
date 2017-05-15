class Ticket < ApplicationRecord

  belongs_to :timetable
  has_one :user

end
