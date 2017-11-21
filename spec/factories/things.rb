require 'ffaker'

FactoryBot.define do
  factory :thing do
    name { FFaker::BaconIpsum.words }
  end
end

