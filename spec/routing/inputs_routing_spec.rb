require "spec_helper"

describe InputsController do
  describe "routing" do

    it "routes to #index" do
      get("/inputs").should route_to("inputs#index")
    end

    it "routes to #new" do
      get("/inputs/new").should route_to("inputs#new")
    end

    it "routes to #show" do
      get("/inputs/1").should route_to("inputs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inputs/1/edit").should route_to("inputs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inputs").should route_to("inputs#create")
    end

    it "routes to #update" do
      put("/inputs/1").should route_to("inputs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inputs/1").should route_to("inputs#destroy", :id => "1")
    end

  end
end
