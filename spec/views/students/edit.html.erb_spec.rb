require 'rails_helper'

RSpec.describe "students/edit", :type => :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :roll_no => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_roll_no[name=?]", "student[roll_no]"

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "input#student_email[name=?]", "student[email]"
    end
  end
end
