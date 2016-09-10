FactoryGirl.define do

  factory :product,  :class => 'Book' do
    title {Faker::Commerce.product_name }
    description    { Faker::Commerce.product_name }
    price    { Faker::Number.number(4) }
    quentity_books { Faker::Number.number(3) }
    image {Faker::Avatar.image}
    author {FactoryGirl.create(:author)}

  end
end
