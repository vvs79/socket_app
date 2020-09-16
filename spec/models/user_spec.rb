require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { User.new(user_name: "name", email: "test@test.com", password: "123456") }
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:user_name) }
  end
end
