FactoryGirl.define do
  factory :customer, :class => 'User' do
    email {Faker::Internet.email}
    password '12345678'
  end
end
