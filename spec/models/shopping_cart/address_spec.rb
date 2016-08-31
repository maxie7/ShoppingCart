require 'rails_helper'

module ShoppingCart
  RSpec.describe Address, type: :model do
    let(:address) { FactoryGirl.create :address }

    it 'has a street address' do
      expect(address).to validate_presence_of(:address)
    end

    it 'has a zip code' do
      expect(address).to validate_presence_of(:zipcode)
    end

    it 'has a city' do
      expect(address).to validate_presence_of(:city)
    end

    it 'has a phone' do
      expect(address).to validate_presence_of(:phone)
    end

    it 'has a country' do
      expect(address).to validate_presence_of(:country)
    end

    it 'belongs to country' do
      expect(address).to belong_to(:country)
    end

    it 'belongs to customer' do
      expect(address).to belong_to(:customer)
    end

  end
end
