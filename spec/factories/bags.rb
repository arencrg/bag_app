require 'ffaker'

FactoryBot.define do
  factory :bag do
    name { FFaker::HipsterIpsum.word }
    description { FFaker::HipsterIpsum.phrase }
  end
end
