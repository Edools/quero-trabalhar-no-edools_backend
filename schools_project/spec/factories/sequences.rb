# Defines a new sequence
FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :subdomain do |n|
    "mypersonalsite#{n}"
  end
end
