FactoryGirl.define do
  factory :room do
    inn { Inn.first }
    is_free true
    number 1
  end
end