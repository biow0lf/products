require 'rails_helper'

describe Product do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it do
      is_expected.to validate_length_of(:name)
        .is_at_least(3).is_at_most(30)
    end
  end
end
