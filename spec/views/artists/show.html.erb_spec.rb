require 'spec_helper'

describe "artists/show.html.erb" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist))
  end

  it "renders attributes in <p>" do
    render
  end
end
