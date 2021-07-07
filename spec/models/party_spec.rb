require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:host) }
    it { should have_many(:viewers) }
    it { should have_many(:users).through(:viewers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:host_id) }
  end
end
