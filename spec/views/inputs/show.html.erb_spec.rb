require 'spec_helper'

describe "inputs/show" do
  before(:each) do
    @input = assign(:input, stub_model(Input))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
