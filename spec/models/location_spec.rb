require 'rails_helper'

RSpec.describe Location, type: :model do

  context "valid location" do
    let(:location) { FactoryGirl.create(:location) }

    it "should save valid instance" do
      expect(location.save).to be true
    end
  end

  context "invalid location" do
    let(:location) { Location.new }

    it "should not save without latitude" do
      location.longitude = "-74.135"
      expect(location.save).to be false
    end

    it "should not save without longitude" do
      location.latitude = "41.00125"
      expect(location.save).to be false
    end
  end
end
