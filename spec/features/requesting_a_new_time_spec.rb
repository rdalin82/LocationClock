require 'rails_helper'

RSpec.describe "requesting a new time" do

  before do
    visit "/"
    stub_params = {:latitude=>40.71417, :longitude=>-74.00639, :request_session=>"1234", :current_time=>DateTime.now}
    allow_any_instance_of(TimeRequestAPI).to receive(:params).and_return(stub_params)
  end

  context "with valid data" do

    it "should show time after submitted with a valid request" do
      fill_in "Latitude", with: "40.71417"
      fill_in "Longitude", with: "-74.00639"
      click_button "Submit"
      expect(page).to have_content("Your request has been processed.")
    end

    it "should handle subsequent requests" do
      fill_in "Latitude", with: "40.71417"
      fill_in "Longitude", with: "-74.00639"
      click_button "Submit"
      fill_in "Latitude", with: "40.71417"
      fill_in "Longitude", with: "-81.00639"
      click_button "Submit"
      expect(page).to have_content("Your request has been processed.")
    end
  end

  context "with invalid data" do

    it "should raise an error with no arguments" do
      fill_in "Latitude", with: ""
      fill_in "Longitude", with: ""
      click_button "Submit"
      expect(page).to have_content("You must supply both a Latitude and Longitude")
    end

    it "should raise an error if latitude argument is out of range" do
      fill_in "Latitude", with: "91.71417"
      fill_in "Longitude", with: "-74.00639"
      click_button "Submit"
      expect(page).to have_content("Latitude must be between -90 and 90")
    end

    it "should raise an error if longitude argument is out of range" do
      fill_in "Latitude", with: "40.71417"
      fill_in "Longitude", with: "-189.00639"
      click_button "Submit"
      expect(page).to have_content("Longitude must be between -180 and 180")
    end
  end
end
