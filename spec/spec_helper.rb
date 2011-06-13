require 'rip_hashrocket'

require "bundler"
Bundler.setup

require 'rspec'

module RipHashrocket
  class Resource
    def self.get(*args)
      raise 'You must stub this, or should_receive at a higher level.'
    end

    def self.post(*args)
      raise 'You must stub this, or should_receive at a higher level.'
    end
  end
end

