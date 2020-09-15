FactoryBot.define do
  factory :chat do
    sequence(:name) { |n| "chat name #{n}" }
  end
end
