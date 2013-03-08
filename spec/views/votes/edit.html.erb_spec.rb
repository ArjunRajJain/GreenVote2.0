require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :rating => "9.99",
      :room_id => "9.99"
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path(@vote), :method => "post" do
      assert_select "input#vote_rating", :name => "vote[rating]"
      assert_select "input#vote_room_id", :name => "vote[room_id]"
    end
  end
end
