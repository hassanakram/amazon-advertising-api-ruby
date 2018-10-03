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
    before (:all) do
      file_path = File.join(File.dirname(__FILE__),"yaml/secret.yaml")
      credentials = YAML.load_file(file_path)
      if credentials
        AmazonAdvertisingApiRuby.current_env = 'test'
        AmazonAdvertisingApiRuby.client_id = credentials["CLIENT_ID"]
        AmazonAdvertisingApiRuby.client_secret = credentials["CLIENT_SECRET"]
        AmazonAdvertisingApiRuby.refresh_token = credentials["REFRESH_TOKEN"]
        AmazonAdvertisingApiRuby.profile_id = credentials["PROFILE_ID"]
      end
    end
  end

  config.include_context "shared setup", :include_shared => true
end
