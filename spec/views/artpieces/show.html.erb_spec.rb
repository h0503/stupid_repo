require 'spec_helper'

describe "artpieces/show.html.erb" do
  before(:each) do
    @artpiece = assign(:artpiece, stub_model(Artpiece))
  end

  it "renders attributes in <p>" do
    render
  end
end
