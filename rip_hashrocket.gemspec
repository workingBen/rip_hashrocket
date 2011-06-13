# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rip_hashrocket/version"

Gem::Specification.new do |s|
  s.name        = "rip_hashrocket"
  s.version     = RipHashrocket::VERSION
  s.authors     = ["Ben Pellow"]
  s.email       = ["ben@campuscred.com"]
  s.homepage    = "http://www.campuscred.com"
  s.summary     = %q{R.I.P. Hash Rocket updates hash syntax for Ruby 1.9}
  s.description = %q{R.I.P. Hash Rocket gem will transform Ruby 1.8 hashrocket syntax into Ruby 1.9 friendly syntax}

  s.rubyforge_project = "rip_hashrocket"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
