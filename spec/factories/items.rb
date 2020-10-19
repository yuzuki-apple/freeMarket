FactoryBot.define do

  factory :item do
    after(:build) do |built_item|
      built_item.images << FactoryBot.build(:image, item: built_item)

      # カテゴリーの単体テストで任意ではあるが今後必要になるかもしれないので残しております
      # after(:build) do |category|
      #   parent_category = create(:category)
      #   # category.save
      #   child_category = category.children.create(name: category.name)
      #   grand_child_category = child_category.children.create(name: child_category.name)
  
      #   category.id = grand_child_category.id
      # end
    end

    name                  {"本"}
    description           {"青チャート"}
    association :category
    condition_id          {1}
    shipment_fee_id       {1}
    shipment_region_id    {1}
    shipment_schedule_id  {1}
    price                 {1800}
    association :user
  end

  factory :image do
    src   { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/public/images/sample.jpg"), 'image/png') }
  end
end
