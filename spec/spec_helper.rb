PROJECT_ROOT = File.expand_path('../..', __FILE__)
Dir[ File.join(PROJECT_ROOT, 'spec/support/**/*.rb') ].each { |file| require file }

require 'useful_matchers/matchers'

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.order = "random"
  config.color = true
end