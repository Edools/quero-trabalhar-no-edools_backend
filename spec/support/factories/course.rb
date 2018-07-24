FactoryBot.define do
  factory :course do
    title  { FFaker::Lorem.word }
    duration '1 mês'
    content { FFaker::Lorem.paragraph }
    description { FFaker::Lorem.paragraph }
    price { Random.new.rand(10).to_f }
    user
    school
  end
end