FactoryBot.define do

  factory :item do
    association :user
    category          {"1"}
    name              {"湯呑"}
    brand             {"吉野家"}
    description       {"吉野家の景品"}
    condition         {"1"}
    shipment_fee_id   {ShipmentFee.all.sample.id}
    shipment_region   {"1"}
    shipment_schedule {"1"}
    stock             {10}
    price             {600}
    after(:build) do |item|
      item.images << build(:image)
    end
  end

end
