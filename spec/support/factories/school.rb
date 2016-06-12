FactoryGirl.define do
  factory :valid_school, class: 'School' do
    name { Forgery(:lorem_ipsum).words(3) }
    owner_email { Forgery('email').address }
    pitch { Forgery(:lorem_ipsum).words(10) }
    subdomain { Forgery(:lorem_ipsum).words(1) }
  end

  factory :invalid_school, parent: :valid_school do
    name nil
    owner_email nil
    pitch nil
    subdomain nil
  end
end
