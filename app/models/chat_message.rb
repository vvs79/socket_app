class ChatMessage < ApplicationRecord
  belongs_to :chat, inverse_of: :chat_messages
  belongs_to :user

  def as_json(options)
    super(options).merge(user_name: user.user_name)
  end
end
