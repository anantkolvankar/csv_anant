require 'rails_helper'

RSpec.describe "students/new", :type => :view do
  before(:each) do
    assign(:student, Student.new(
      :roll_no => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_roll_no[name=?]", "student[roll_no]"

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "input#student_email[name=?]", "student[email]"
    end
  end
end
