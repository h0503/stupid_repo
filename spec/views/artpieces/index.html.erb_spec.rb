require 'spec_helper'

describe "artpieces/index.html.erb" do
  before(:each) do
    assign(:artpieces, [
      stub_model(Artpiece),
      stub_model(Artpiece)
    ])
  end

  it "renders a list of artpieces" do
    render
  end
end
