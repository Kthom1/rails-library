# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    first_name 'joe'
    last_name 'joe'
    sequence(:email) { |n| "test#{n}@test.com" }
    password '12345678'
    password_confirmation '12345678'
  end
end
