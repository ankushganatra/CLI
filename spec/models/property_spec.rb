require 'logger'
require 'active_record'
require_relative '../../spec/spec_helper'
require 'factory_girl'

describe :property do

  after(:each) do
    Property.delete_all
  end

  it 'has a valid data' do
    expect(FactoryGirl.create(:property)).to be_valid
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:property, title: nil)).to be_invalid
  end

  it 'should not save invalid phone' do
    expect(FactoryGirl.build(:property, phone_number: '111111')).to be_invalid
  end

  it 'should not save invalid email' do
    expect(FactoryGirl.build(:property, email: '111111')).to be_invalid
  end

  it 'should not save invalid email' do
    expect(FactoryGirl.build(:property, email: '111111')).to be_invalid
  end

  it 'should not save invalid max guest' do
    expect(FactoryGirl.build(:property, max_guests: 'asdasd')).to be_invalid
  end

  it 'should not save invalid max guest' do
    expect(FactoryGirl.build(:property, nightly_rate_in_eur: 'asdasd')).to be_invalid
  end

  it 'should save a valid property type only' do
    expect(FactoryGirl.build(:property, property_type: 'asdasd')).to be_invalid
    expect(FactoryGirl.build(:property, id: 2, property_type: 'apartment')).to be_valid
    expect(FactoryGirl.build(:property, id: 3, property_type: 'holiday home')).to be_valid
    expect(FactoryGirl.build(:property, id: 4,property_type: 'private room')).to be_valid
  end


end
