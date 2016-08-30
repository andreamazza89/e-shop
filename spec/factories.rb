FactoryGirl.define do
  factory :voucher do
    discount 1
    description "MyString"
  end

  factory :product do
    name           'shoe'
    category       'test category'
    price          1234
    stock_quantity 4 
  end

end
