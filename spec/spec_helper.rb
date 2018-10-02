require "bundler/setup"
require "amazon_advertising_api_ruby"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  RSpec.shared_context "shared setup", :shared_context => :metadata do
    before do
      AmazonAdvertisingApiRuby.test_env = true
      AmazonAdvertisingApiRuby.profile_id = ENV["PROFILE_ID"]
      AmazonAdvertisingApiRuby.client_id = ENV["CLIENT_ID"]
      AmazonAdvertisingApiRuby.client_secret = ENV["CLIENT_SECRET"]
      AmazonAdvertisingApiRuby.refresh_token = ENV["REFRESH_TOKEN"]
    end
  end

  RSpec.configure do |rspec|
    rspec.include_context "shared setup", :include_shared => true
  end

end
