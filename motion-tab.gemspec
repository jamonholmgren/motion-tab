# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-tab/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ClearSight Studio"]
  gem.email         = ["contact@clearsightstudio.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-tab"
  gem.require_paths = ["lib"]
  gem.version       = MotionTab::VERSION
end
