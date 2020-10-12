FactoryBot.define do

  factory :item do
    after(:build) do |built_item|
      built_item.images << FactoryBot.build(:image, item: built_item)
    end
    name                  {"湯呑"}
    brand                 {"吉野家"}
    description           {"吉野家の景品"}
    category              {"1"}
    condition             {"1"}
    shipment_fee_id       {1}
    shipment_region_id    {1}
    shipment_schedule_id  {1}
    stock                 {10}
    price                 {600}
    user_id               {"1"}
  end

  factory :image do
    src   { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/public/images/test_image.jpg"), 'image/png') }
  end
end