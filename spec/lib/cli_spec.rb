require_relative "../../lib/models/property"
require_relative '../../lib/cli'

require_relative '../../spec/spec_helper'
require 'factory_girl'

describe Cli::Cli do

  before(:each) do
    FactoryGirl.create(:property)
  end

  after(:each) do
    Property.delete_all
  end

  context "list" do
    let(:output) { capture(:stdout) { subject.list } }

    it "returns a list" do
      output.should include("Found 1 offer")
    end
  end

end
