require "rails_helper"

RSpec.describe SetListsController, type: :routing do

# TODO: Set Lists belongs to a User, so these tests won't work.
# Write these while referring to the proper routes

  describe "routing" do
    it "routes to #index" do
      pending(get: "/set_lists").to route_to("set_lists#index")
    end

    it "routes to #new" do
      pending(get: "/set_lists/new").to route_to("set_lists#new")
    end

    it "routes to #show" do
      pending(get: "/set_lists/1").to route_to("set_lists#show", id: "1")
    end

    it "routes to #edit" do
      pending(get: "/set_lists/1/edit").to route_to("set_lists#edit", id: "1")
    end


    it "routes to #create" do
      pending(post: "/set_lists").to route_to("set_lists#create")
    end

    it "routes to #update via PUT" do
      pending(put: "/set_lists/1").to route_to("set_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      pending(patch: "/set_lists/1").to route_to("set_lists#update", id: "1")
    end

    it "routes to #destroy" do
      pending(delete: "/set_lists/1").to route_to("set_lists#destroy", id: "1")
    end
  end

end
