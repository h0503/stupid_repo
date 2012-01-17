require 'spec_helper'

describe TestController do

  describe "GET 'ind'" do
    it "should be successful" do
      get 'ind'
      response.should be_success
    end
  end

  describe "GET 'p1'" do
    it "should be successful" do
      get 'p1'
      response.should be_success
    end
  end

  describe "GET 'p2'" do
    it "should be successful" do
      get 'p2'
      response.should be_success
    end
  end

  describe "GET 'p3'" do
    it "should be successful" do
      get 'p3'
      response.should be_success
    end
  end

  describe "GET 'p4'" do
    it "should be successful" do
      get 'p4'
      response.should be_success
    end
  end

  describe "GET 'res'" do
    it "should be successful" do
      get 'res'
      response.should be_success
    end
  end

end
