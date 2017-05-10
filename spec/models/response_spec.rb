require 'rails_helper'

RSpec.describe Response, type: :model do

  context "valid response" do
    let(:response) {FactoryGirl.create(:response) }

    it "should save a valid instance" do
      expect(response.save).to be true
    end
  end
end
