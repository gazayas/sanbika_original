require 'rails_helper'

RSpec.describe "SetListSongs", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/set_list_songs/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/set_list_songs/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/set_list_songs/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
