require 'spec_helper'

describe Helpdoc do

  def reset_helpdoc(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @helpdoc.destroy! if @helpdoc
    @helpdoc = Helpdoc.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_helpdoc
  end

  context "validations" do
    
    it "rejects empty title" do
      Helpdoc.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_helpdoc
      Helpdoc.new(@valid_attributes).should_not be_valid
    end
    
  end

end