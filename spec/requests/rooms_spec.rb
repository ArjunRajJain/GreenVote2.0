require 'spec_helper'

describe "Rooms" do
  describe "GET /rooms" do
  	before do
      visit rooms_path
      visit rooms_path
  	  click_link "New Room"
  	  fill_in "Name", with: "Something"
    end
    it "works! (now write some real specs)" do
  		click_button "Create Room"
    end
  end
  describe "Major Uploading" do
  	it "works!" do

  	end
  end
end
