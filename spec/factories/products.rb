FactoryBot.define do
  factory :product do
    product_name      {'ゲーム'}
    description       {'アクションゲーム'}
    category_id       {6}
    state_id          {3}
    deliver_fee_id    {2}
    shipment_id       {30}
    shipment_day_id   {2}
    price             {4500}
    association :user
  end
end
