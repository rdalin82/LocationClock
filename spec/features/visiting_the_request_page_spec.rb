require 'rails_helper'

RSpec.describe "visiting the request page" do

  context "with no data" do

    before do
      visit "/"
    end

    it "should have a text box for Latitude" do
      expect(page).to have_content("Latitude")
    end

    it "should have a text box for Longitude" do
      expect(page).to have_content("Longitude")
    end

    it "should have a submit button" do
      expect(page).to have_button("Submit")
    end
  end
end
