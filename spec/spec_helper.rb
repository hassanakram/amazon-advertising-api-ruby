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


  def set_configurations
    AmazonAdvertisingApiRuby.client_secret = "dca56ef202a018d5d3aa7584b2cf97d7e9c5269b466faf77f1a0e79861b0b0c1"
    AmazonAdvertisingApiRuby.client_id = "amzn1.application-oa2-client.f877a1151fe442fe96ce9ec11424feb4"
    AmazonAdvertisingApiRuby.refresh_token = "Atzr|IwEBIJG6z1RJ6kB1Gd9QftBdW23QDjyGDkmN4LXayqOsjCKiZn9_80iyROvtOBJgwAC3gUXWhi3rKwWUNPE6XnDETKCPSIDE2D8IOuD01N0DqFENtjQKvOlVcaQ4PJIRcF_4rCa_Xt5stoMjQy1qA4fguH-Au15aioORNhRpaW17k8BwvHOBu3iKt9xKhKaRbQdEFFbN-kJ1Br_QEtPXG8aZeuzmK4C37aUVK6egNk5NlbwT8YYkecNSPIUCPZa-7xvfjFaPYAQCn4oveHziqATm-tlvigiju-3s3v00p0ubF7tmuO_HtKn8q-UhDEykOpuGUTKakLv8AjtgjNYrXHKn6Cw4rMvq_o6BZ-YEDpDySNGQ3xtURwZLbwp6oCkMtaEH5hdPAul8xo04BF6p3ypcT6U15ZOMgFMt8s4S51CuZX3ohyjRJwcBK9BEycKw3fkIAJbNwS_OgytxAUhSWr9T7gSZ8oxp7fovPDceq8z-nrc_fBMikBWq7DFBpwAC9qpz8_AseNOzhnLFkMCp-5OPn2nym3bRAq9IyCEDopcv16dw9BudxUrDT-XMAzwmlROXdjA"
    AmazonAdvertisingApiRuby.profile_id = '666126779467911'
    AmazonAdvertisingApiRuby.test_env = true
    AmazonAdvertisingApiRuby.access_token = AmazonAdvertisingApiRuby::Token.retrieve
  end

end
