require 'spec_helper'

describe "outputs/index" do
  before(:each) do
    assign(:outputs, [
      stub_model(Output),
      stub_model(Output)
    ])
  end

  it "renders a list of outputs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
