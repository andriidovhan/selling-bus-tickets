class Timetable < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :place_depart, :place_arrive, presence: true
  validates :time_depart, presence: true
  validates :time_arrive, presence: true #TODO , date: { greater_than: :time_depart }
  validates :amount_of_place, presence: true, numericality: { greater_than_or_equal_to: 1 }

  after_create :create_tickets

  def create_tickets
    i = 1
    while i <= Timetable.last.amount_of_place do
    Ticket.create(number_of_place: i.to_i, available: true, timetable_id: Timetable.last.id, user_id: nil)
      i = i + 1
    end
  end
end