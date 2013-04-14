# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'middleman-processing/version'

Gem::Specification.new do |s|
  s.name        = 'middleman-processing'
  s.version     = Middleman::Processing::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jim Riordan']
  s.email       = ['jim@j1mr10rd4n.info']
  s.homepage    = 'https://github.com/j1mr10rd4n.info/middleman-processing'
  s.summary     = %q{Process images in your Middleman project}
  s.description = %q{Provides carrierwave-style image processing during the build phase of your Middleman project}

  s.rubyforge_project = 'middleman-processing'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency('middleman', ['>= 3.0.0'])
  s.add_development_dependency('rr')
end
