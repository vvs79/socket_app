require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  let(:user) { FactoryBot.create :user }

  before do
    stub_connection user_id: user.id
  end

  it "subscribes to a stream when chat_id is provided" do
    subscribe(chat_id: 11)
    expect(subscription).to be_confirmed
    expect(streams).to include("chat_11")
  end
end
