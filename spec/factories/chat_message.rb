FactoryBot.define do
  factory :chat_message do
    sequence(:message) { |n| "message #{n}" }
    user_id { User.last.try(:id) || create(:user).id }
    chat_id { Chat.last.try(:id) || create(:chat).id }
  end
end
