# frozen_string_literal: true

FactoryBot.define do
  factory :school do
    user
    name 'MyString'
    pitch 'MyString'
    subdomain { generate(:subdomain) }
  end
end
