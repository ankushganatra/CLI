require_relative "../../lib/models/property"

FactoryGirl.define do
  factory :property, :class => Property do
    id "1"
    title "Title 1"
    property_type "apartment"
    address "123 Address line 1"
    nightly_rate_in_eur "20"
    max_guests "2"
    email "abc@gmail.com"
    phone_number "2345678901"
    completed "true"
  end
end