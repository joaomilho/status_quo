# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "status_quo/version"

Gem::Specification.new do |s|
  s.name        = "status_quo"
  s.version     = StatusQuo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juan Maiz"]
  s.email       = ["juanmaiz@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{The really f*cking simple solution for status}
  s.description = %q{No CONSTANTS. No numbers. No stupid state machines. F*cking simple stuff.}

  s.rubyforge_project = "status_quo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
