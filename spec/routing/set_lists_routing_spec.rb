require "rails_helper"

RSpec.describe SetListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/set_lists").to route_to("set_lists#index")
    end

    it "routes to #new" do
      expect(get: "/set_lists/new").to route_to("set_lists#new")
    end

    it "routes to #show" do
      expect(get: "/set_lists/1").to route_to("set_lists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/set_lists/1/edit").to route_to("set_lists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/set_lists").to route_to("set_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/set_lists/1").to route_to("set_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/set_lists/1").to route_to("set_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/set_lists/1").to route_to("set_lists#destroy", id: "1")
    end
  end
end
