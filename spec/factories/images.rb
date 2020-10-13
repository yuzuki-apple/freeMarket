FactoryBot.define do

  factory :image do
    src {File.open("#{Rails.root}/public/images/sample.jpg")}
  end

end
