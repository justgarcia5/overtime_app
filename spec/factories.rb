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
    first_name 'Jon'
    last_name 'Snow'
    email 'email@test.com'
    password '123456'
  end

  factory :admin, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email 'admin@test.com'
    password '123456'
  end

  factory :non_authorized_user, class: 'User' do
    first_name 'Non'
    last_name 'Auth'
    email 'nonauth@test.com'
    password '123456'
  end
end
