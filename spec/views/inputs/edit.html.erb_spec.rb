require 'spec_helper'

describe "inputs/edit" do
  before(:each) do
    @input = assign(:input, stub_model(Input))
  end

  it "renders the edit input form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inputs_path(@input), :method => "post" do
    end
  end
end
