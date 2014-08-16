require 'useful_matchers/matchers/independent'

module UsefulMatchers
  module Matchers
  end
end

def recurse_to_leaf_modules(mod)
  leaf_nodes = []
  next_level = mod.constants.collect {
    |c| mod.const_get(c)
  }.select {
    |c| c.instance_of?(Module)
  }.each do |child|
    leaf_nodes.concat recurse_to_leaf_modules child
  end
  
  if next_level.empty? && mod.instance_of?(Module)
    return [mod]
  else
    return leaf_nodes
  end
end

if RSpec.respond_to?(:configure)
  RSpec.configure do |config|
    recurse_to_leaf_modules(UsefulMatchers::Matchers).each do |mod|
      config.include mod
    end
  end
end