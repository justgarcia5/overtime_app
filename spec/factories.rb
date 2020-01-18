# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'Post1'
  end

  factory :post2 do
    date Date.today
    rationale 'Post2'
  end

  factory :user do
    first_name 'Test'
    last_name 'Testing'
    email 'email@email.com'
    password '123456'
  end
end
