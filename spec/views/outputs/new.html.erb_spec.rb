require 'spec_helper'

describe "outputs/new" do
  before(:each) do
    assign(:output, stub_model(Output).as_new_record)
  end

  it "renders new output form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => outputs_path, :method => "post" do
    end
  end
end
