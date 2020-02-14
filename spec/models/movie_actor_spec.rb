require 'rails_helper'

RSpec.describe MovieActors, type: :model do
  describe 'relationships' do
    it { should belong_to :movies }
    it { should belong_to :actors }
  end
end
