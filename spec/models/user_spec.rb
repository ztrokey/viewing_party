require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:parties) }
    it { should have_many(:viewers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:user_name) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end
end
