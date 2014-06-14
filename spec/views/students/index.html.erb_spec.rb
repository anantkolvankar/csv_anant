require 'rails_helper'

RSpec.describe "students/index", :type => :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :roll_no => 1,
        :name => "Name",
        :email => "Email"
      ),
      Student.create!(
        :roll_no => 1,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
