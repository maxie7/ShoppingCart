FactoryGirl.define do
  factory :coupon , :class => 'ShoppingCart::Coupon' do
    number "MyString"
    price "9.99"
  end
end
