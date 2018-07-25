# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password 'test123123'
  end
end
