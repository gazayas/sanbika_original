require 'rails_helper'

RSpec.describe "set_lists/new", type: :view do
  before(:each) do
    assign(:set_list, SetList.new(
      title: "MyString",
      user: nil
    ))
  end

  it "renders new set_list form" do
    render

    assert_select "form[action=?][method=?]", set_lists_path, "post" do

      assert_select "input[name=?]", "set_list[title]"

      assert_select "input[name=?]", "set_list[user_id]"
    end
  end
end
