require 'rails_helper'

RSpec.describe "set_lists/edit", type: :view do
  before(:each) do
    @set_list = assign(:set_list, SetList.create!(
      title: "MyString",
      user: nil
    ))
  end

  it "renders the edit set_list form" do
    render

    assert_select "form[action=?][method=?]", set_list_path(@set_list), "post" do

      assert_select "input[name=?]", "set_list[title]"

      assert_select "input[name=?]", "set_list[user_id]"
    end
  end
end
