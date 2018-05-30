require 'rails_helper'

RSpec.describe User, type: :model do

	it "has a valid user" do
    expect(build(:user)).to be_valid
  end

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity  }
  it { is_expected.to validate_presence_of :password }
	it { is_expected.to validate_presence_of :password_confirmation }




end
