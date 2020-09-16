require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:chat).inverse_of(:chat_messages) }
  end
end
