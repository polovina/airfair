require 'spec_helper'

describe "outputs/show" do
  before(:each) do
    @output = assign(:output, stub_model(Output))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
