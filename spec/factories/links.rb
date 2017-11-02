FactoryGirl.define do
  factory :link do
    association :product, factory: :product
    expiration_date "2016-06-24 15:36:54"
    downloads 1
    downloads_limit 1
    custom_id nil
    email "aa@hola.com"
  end
end
