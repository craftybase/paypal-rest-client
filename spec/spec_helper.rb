require "simplecov"
SimpleCov.start do
  add_filter ".bundle/"
  add_filter "spec/"
end

require "rspec"
require "webmock/rspec"
require "vcr"
require "pry"
require "paypal/rest/client"

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
  c.default_cassette_options = { record: :all } # :new_episodes
  c.configure_rspec_metadata!
end
