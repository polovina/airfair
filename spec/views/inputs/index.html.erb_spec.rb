require 'spec_helper'

describe "inputs/index" do
  before(:each) do
    assign(:inputs, [
      stub_model(Input),
      stub_model(Input)
    ])
  end

  it "renders a list of inputs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
