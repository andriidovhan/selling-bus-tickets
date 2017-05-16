require 'rails_helper'
require 'spec_helper'

describe User do
  it 'has valid factory' do
    expect(create(:user)).to be_valid
  end

  it 'is valid without last_name' do
    expect(build(:user, last_name: nil)).to be_valid
  end

  it 'is invalid without first_name' do
    expect(build(:user, first_name: nil)).not_to be_valid
  end

  it 'is invalid with too short first_name' do
    expect(build(:user, first_name: 'q')).not_to be_valid
  end

  it 'is invalid with first_name > 20 chars' do
    expect(build(:user, first_name: 'testlongname_testlongname')).not_to be_valid
  end

  it 'is invalid without email' do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid with wrong email' do
    expect(build(:user, email: 'test@test')).not_to be_valid
  end

  it 'is invalid without password' do
    expect(build(:user, password: nil)).not_to be_valid
  end

  it 'is invalid with short password' do
    expect(build(:user, password: 'test')).not_to be_valid
  end
end