require "spec_helper"

describe OutputsController do
  describe "routing" do

    it "routes to #index" do
      get("/outputs").should route_to("outputs#index")
    end

    it "routes to #new" do
      get("/outputs/new").should route_to("outputs#new")
    end

    it "routes to #show" do
      get("/outputs/1").should route_to("outputs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/outputs/1/edit").should route_to("outputs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/outputs").should route_to("outputs#create")
    end

    it "routes to #update" do
      put("/outputs/1").should route_to("outputs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/outputs/1").should route_to("outputs#destroy", :id => "1")
    end

  end
end
