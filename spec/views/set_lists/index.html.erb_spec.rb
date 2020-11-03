require 'rails_helper'

RSpec.describe "set_lists/index", type: :view do
  before(:each) do
    assign(:set_lists, [
      SetList.create!(
        title: "Title",
        user: nil
      ),
      SetList.create!(
        title: "Title",
        user: nil
      )
    ])
  end

  it "renders a list of set_lists" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
