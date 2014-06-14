require 'rails_helper'

RSpec.describe "Students", :type => :request do
  describe "GET /students" do
    it "works! (now write some real specs)" do
      get students_path
      expect(response.status).to be(200)
    end
  end
  describe "GET /csv_upload" do
  	it "should give form to upload csv file" do
  		get csv_upload_path
  		expect(response.status).to be(200)
  	end
  end

end
