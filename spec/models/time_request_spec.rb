require 'rails_helper'

RSpec.describe TimeRequest, type: :model do

  context "valid request" do
    let(:request) { FactoryGirl.create(:time_request)}

    it "should have a valid instance" do
      expect(request.save).to be true
    end
  end

  context "invalid requests" do
    let(:request) {TimeRequest.new}

    it "should not save without latitude" do
      request.longitude = -74.00639
      request.request_session = "571dab0e12c881ab2252fc0647dad1db"
      expect(request.save).to be false
    end

    it "should not save without longitude" do
      request.latitude = 40.71417
      request.request_session = "571dab0e12c881ab2252fc0647dad1db"
      expect(request.save).to be false
    end

    it "should not save without a request_session id" do
      request.latitude = 40.71417
      request.longitude = -74.00639
      expect(request.save).to be false
    end
  end
end
