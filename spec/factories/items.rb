FactoryBot.define do
  factory :item do
    name             {"tomato"}
    price            {500}
    area_id          {2}
    category_id      {2}
    condition_id     {2}
    days_id          {2}
    load_id          {2}
    explanation      {"あ"}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/comment.png'), filename: 'comment.png')
    end
  end
end
