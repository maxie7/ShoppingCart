require 'rails_helper'

 module ShoppingCart
   RSpec.describe Coupon, type: :model do
     let(:subject) { FactoryGirl.create(:coupon) }

     it { expect(subject).to have_many(:orders)}
  end
end
