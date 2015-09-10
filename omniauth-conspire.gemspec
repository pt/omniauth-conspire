# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-conspire/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-conspire"
  s.version     = OmniAuth::Conspire::VERSION
  s.authors     = ["Parker Thompson"]
  s.email       = ["parkert@gmail.com"]
  s.homepage    = "https://github.com/parkert/omniauth-conspire"
  s.description = %q{OmniAuth strategy for Conspire}
  s.summary     = s.description
  s.license     = "Public Domain"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'json', '~> 1.3'
  s.add_dependency 'omniauth-oauth', '~> 1.1'
  s.add_development_dependency 'bundler', '~> 1.0'
end
