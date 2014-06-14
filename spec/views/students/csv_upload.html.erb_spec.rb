require 'rails_helper'

RSpec.describe "students/csv_upload", :type => :view do
  before(:each) do
    assign(:student, Student.new(
      :roll_no => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders csv_upload form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

    assert_select "input#student_file[name=?]", "student[file]"

    end
  end
end
