FactoryBot.define do

  factory :item do
    after(:build) do |built_item|
      built_item.images << FactoryBot.build(:image, item: built_item)
    end
    name                  {"本"}
    description           {"参考書になります"}
    category              {"1"}
    condition             {"1"}
    shipment_fee_id       {"1"}
    shipment_region_id    {"1"}
    shipment_schedule_id  {"1"}
    price                 {"9999"}
    user_id               {"1"}
  end

  factory :image do
    src   { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/public/images/test_image.jpg"), 'image/png') }
  end
end