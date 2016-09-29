require "spec_helper"

describe EmeraldFW do

  context "Properties" do

  	it "has a version number" do
      expect(EmeraldFW::VERSION).not_to be nil
    end

  end

end