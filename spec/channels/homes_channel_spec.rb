require 'rails_helper'

RSpec.describe HomesChannel, type: :channel do
  current_user = User.first
   before do
    stub_connection current_user: current_user
  end

  # it "rejects when no no channel to subscribe" do
  #   subscribe
  #   expect(subscription).to be_rejected
  # end

  # it "subscribe to all user image" do 
  	

  # end



end
