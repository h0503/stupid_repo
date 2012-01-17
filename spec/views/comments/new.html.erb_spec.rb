require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :commenter => "MyString",
      :body => "MyText",
      :post => nil
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_commenter", :name => "comment[commenter]"
      assert_select "textarea#comment_body", :name => "comment[body]"
      assert_select "input#comment_post", :name => "comment[post]"
    end
  end
end
