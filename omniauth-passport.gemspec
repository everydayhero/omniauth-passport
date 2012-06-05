# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-passport/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Cooper"]
  gem.email         = ["coop@latrobest.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-passport"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Passport::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.0.2'
end
