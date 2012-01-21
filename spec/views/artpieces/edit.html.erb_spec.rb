require 'spec_helper'

describe "artpieces/edit.html.erb" do
  before(:each) do
    @artpiece = assign(:artpiece, stub_model(Artpiece))
  end

  it "renders the edit artpiece form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artpieces_path(@artpiece), :method => "post" do
    end
  end
end
