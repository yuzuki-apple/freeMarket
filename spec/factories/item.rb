FactoryBot.define do

  factory :item do
    images                {File.open("#{Rails.root}/public/images/test_image.jpg")}
    name                  {"abe"}
    description           {"aaaa"}
    category              {"1"}
    condition             {"1"}
    shipment_fee_id       {"1"}
    shipment_region_id    {"1"}
    shipment_schedule_id  {"1"}
    price                 {"9999"}
    user
    # association
  end

end