FactoryBot.define do
  factory :course do
    user
    school
    title "MyString"
    description "MyText"
    content "MyText"
    duration "9.99"
    price Money.new(0)
  end
end
