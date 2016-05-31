require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_uniqueness_of(:user_name) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(described_class::MIN_LENGTH_USER_NAME) }

    it { is_expected.to allow_value('1_testUSER').for(:user_name) }
    it { is_expected.not_to allow_value('user name').for(:user_name) }
  end
end
