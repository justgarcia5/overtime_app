# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'Rationale'
  end

  factory :user do
    first_name 'Test'
    last_name 'Testing'
    email 'email@email.com'
    password '123456'
  end
end
