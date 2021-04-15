require 'rails_helper'
require 'spec_helper'
require_relative '../support/devise'

# TODO: Handle POST and UPDATE requests with valid and invalid parameters.
# This can be done in an integration test.
#
# Some helpful expectations:
# expect { (...write logic here...) }.to_change(SetList, :count).by(1)
# expect(response).to redirect_to(set_list_url(SetList.last))

RSpec.describe "/set_lists", type: :request do
  let(:user) { FactoryBot.create(:user_with_populated_set_lists) }

  # We call the user path here because set lists are displayed on the user's profile
  describe "GET Set Lists (GET /show for User)" do
    it "renders a successful response" do
      visit user_path(id: user)
      expect(page).to have_http_status(200)
      expect(page).to have_content('セットリスト1')
    end
  end

  describe "NEW User Set List" do
    it "renders a successful response" do
      visit new_user_set_list_path(user_id: user.id)
      expect(page).to have_http_status(200)
      expect(page).to have_content('新しいセットリスト')
    end
  end

  # TODO: Make sure all authentications are in place
  describe "EDIT User Set List" do
    it "renders a successful response" do
      visit edit_user_set_list_path(id: user.set_lists.first, user_id: user.id)
      pending(page).to have_http_status(200)
      pending(page).to have_content('セットリストの編集')
    end
  end

  # TODO: Make sure all authentications are in place
  describe "DELETE User Set List" do
    it "destroys the requested set_list" do
      login_as user
      visit user_set_list_path(id: user.set_lists.first, user_id: user.id)
      click_on '削除'
      pending(page).to have_http_status(200)
      pending(page).to have_content('セットリストを削除しました。')
    end

    it "redirects to the set lists list" do
      pending(current_path).to eql(user_path(user))
    end
  end

end
