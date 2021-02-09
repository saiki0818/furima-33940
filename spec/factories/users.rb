FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test'}
    password              {'test123'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1993-03-20'}
  end
end