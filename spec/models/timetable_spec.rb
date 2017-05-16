require 'rails_helper'
require 'spec_helper'

describe Timetable do
  it 'has valid factory' do
    expect(create(:timetable)).to be_valid
  end

  it 'is invalid without place_depart' do
    expect(build(:timetable, place_depart: nil)).not_to be_valid
  end

  it 'is invalid without time_arrive' do
    expect(build(:timetable, time_arrive: nil)).not_to be_valid
  end

  it 'is invalid without amount_of_place' do
    expect(build(:timetable, amount_of_place: nil)).not_to be_valid
  end

  it 'is invalid with amount_of_place is text' do
    expect(build(:timetable, amount_of_place: 'text')).not_to be_valid
  end

  it 'is invalid with amount_of_place is 0' do
    expect(build(:timetable, amount_of_place: 0)).not_to be_valid
  end
end