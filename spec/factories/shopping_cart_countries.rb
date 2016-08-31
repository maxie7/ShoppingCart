FactoryGirl.define do
  factory :country, :class => 'ShoppingCart::Country' do
    name { Faker::Address.country }
  end
end
