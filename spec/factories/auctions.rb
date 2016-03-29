FactoryGirl.define do
  factory :auction do
    title "Test Auction item"
    details "Test Auction item details!"
    end_date "2016-03-29 09:47:55"
    reserve_price 100
    current_price 100
  end
end
