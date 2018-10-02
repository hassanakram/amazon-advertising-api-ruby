require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Token do

  it "gets a token" do
    binding.pry
    expect(AmazonAdvertisingApiRuby.access_token).not_to be nil
  end

end
