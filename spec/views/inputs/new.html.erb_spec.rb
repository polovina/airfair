require 'spec_helper'

describe "inputs/new" do
  before(:each) do
    assign(:input, stub_model(Input).as_new_record)
  end

  it "renders new input form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inputs_path, :method => "post" do
    end
  end
end
