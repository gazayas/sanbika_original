require 'rails_helper'

RSpec.describe "set_lists/show", type: :view do
  before(:each) do
    @set_list = assign(:set_list, SetList.create!(
      title: "Title",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
