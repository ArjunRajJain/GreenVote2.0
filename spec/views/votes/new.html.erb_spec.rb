require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote,
      :rating => "9.99",
      :room_id => "9.99"
    ).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path, :method => "post" do
      assert_select "input#vote_rating", :name => "vote[rating]"
      assert_select "input#vote_room_id", :name => "vote[room_id]"
    end
  end
end
