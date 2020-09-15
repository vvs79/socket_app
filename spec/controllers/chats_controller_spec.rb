require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:chat) { FactoryBot.create :chat }

  describe 'Before actions' do
    it { should use_before_action(:authenticate_user!) }
    it { should use_before_action(:_get_chats) }
  end

  it '#index should redirect to sign_in page, 302 status for non-authorized users' do
    get :index
    expect(response).to have_http_status(302)
  end

  it '#new should redirect to sign_in page, 302 status for non-authorized users' do
    get :new
    expect(response).to have_http_status(302)
  end

  it '#show should redirect to sign_in page, 302 status for non-authorized users' do
    get :show, params: { id: 0 }
    expect(response).to have_http_status(302)
  end

  it '#create should redirect to sign_in page, 302 status for non-authorized users' do
    post :create
    expect(response).to have_http_status(302)
  end

  describe 'user logged in' do
    before :each do
      sign_in user, scope: :user
    end

    it '#index should return 200 status' do
      get :index
      expect(response).to have_http_status(200)
    end

    it '#new should return 200 status' do
      get :new
      expect(response).to have_http_status(200)
    end

    it '#show should return 200 status' do
      get :show, params: { id: chat.id }
      expect(response).to have_http_status(200)
    end

    describe "#create" do
      subject { post :create, params: { chat: { name: 'new chat' } } }

      it '#create should redirect_to show page' do
        subject.should redirect_to action: :show, id: assigns(:chat).id
      end
    end
  end
end
