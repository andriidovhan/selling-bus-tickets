class Timetable < ApplicationRecord
  has_many :tickets, dependent: :destroy

  after_create :create_tickets

  def create_tickets
    i = 1
    while i <= Timetable.last.amount_of_place do
    Ticket.create(number_of_place: i.to_i, available: true, timetable_id: Timetable.last.id)
      i = i + 1
    end
  end
end