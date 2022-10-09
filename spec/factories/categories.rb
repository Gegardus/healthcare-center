# frozen_string_literal: true

FactoryBot.define do
    factory :category do
      association :doctor 
      name { Faker::Lorem.characters }  
    end
  end

