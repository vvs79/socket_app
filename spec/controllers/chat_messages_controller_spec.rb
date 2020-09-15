require 'rails_helper'

RSpec.describe ChatMessagesController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:chat) { FactoryBot.create :chat }

  describe 'Before actions' do
    it { should use_before_action(:authenticate_user!) }
    it { should use_before_action(:_get_chat) }
  end

  it '#create should redirect to sign_in page, 302 status for non-authorized users' do
    post :create
    expect(response).to have_http_status(302)
  end

  describe 'user logged in' do
    before :each do
      sign_in user, scope: :user
    end

    it '#create should have 204 status' do
      post :create, params: { chat_message: { chat_id: chat.id, message: 'new message' } }
      expect(response).to have_http_status(204)
    end
  end
end
