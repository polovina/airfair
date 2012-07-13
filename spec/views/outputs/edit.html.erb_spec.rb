require 'spec_helper'

describe "outputs/edit" do
  before(:each) do
    @output = assign(:output, stub_model(Output))
  end

  it "renders the edit output form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outputs_path(@output), :method => "post" do
    end
  end
end
