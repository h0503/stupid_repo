require 'spec_helper'

describe "artpieces/new.html.erb" do
  before(:each) do
    assign(:artpiece, stub_model(Artpiece).as_new_record)
  end

  it "renders new artpiece form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artpieces_path, :method => "post" do
    end
  end
end
