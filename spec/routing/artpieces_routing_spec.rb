require "spec_helper"

describe ArtpiecesController do
  describe "routing" do

    it "routes to #index" do
      get("/artpieces").should route_to("artpieces#index")
    end

    it "routes to #new" do
      get("/artpieces/new").should route_to("artpieces#new")
    end

    it "routes to #show" do
      get("/artpieces/1").should route_to("artpieces#show", :id => "1")
    end

    it "routes to #edit" do
      get("/artpieces/1/edit").should route_to("artpieces#edit", :id => "1")
    end

    it "routes to #create" do
      post("/artpieces").should route_to("artpieces#create")
    end

    it "routes to #update" do
      put("/artpieces/1").should route_to("artpieces#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/artpieces/1").should route_to("artpieces#destroy", :id => "1")
    end

  end
end
