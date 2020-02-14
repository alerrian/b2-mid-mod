require 'rails_helper'

RSpec.describe Studio, type: :model do
  it 'validates' do
    it { should validate_presence_of :name }
  end

  it 'has relationships' do
    it { should have_many :movies }
  end
end
