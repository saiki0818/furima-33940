FactoryBot.define do
  factory :buyer_address do
    postal_code   {"500-5000"}
    shipment_id   {3}
    city          {"大阪市"}
    house_number  {"浪速区123"}
    building      {"ハイツ502"}
    tell          {"08012345678"}

  end
end
