FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {Faker::Internet.free_email}
    password              {"1aA3456"}
    password_confirmation    {"1aA3456"}
    last_name           {"山田"}
    last_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end

end