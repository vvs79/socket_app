require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe 'Associations' do
    it { should have_many(:chat_messages)
           .dependent(:destroy)
           .inverse_of(:chat) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
