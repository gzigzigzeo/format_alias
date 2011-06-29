# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "format_alias/version"

Gem::Specification.new do |s|
  s.name        = "format_alias"
  s.version     = FormatAlias::VERSION
  s.authors     = ["Victor Sokolov"]
  s.email       = ["gzigzigzeo@gmail.com"]
  s.homepage    = "http://github.com/gzigzigzeo/format_alias"
  s.summary     = %q{ActiveRecord attribute accessor aliases for date formatting etc.}
  s.description = %q{ActiveRecord attribute accessor aliases for date formatting etc.}

  s.rubyforge_project = "format_alias"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'activerecord', '>= 3.0'
  s.add_dependency 'activesupport', '>= 3.0'  
  
  s.add_development_dependency('rspec-rails')  
  s.add_development_dependency('sqlite3-ruby')
end
