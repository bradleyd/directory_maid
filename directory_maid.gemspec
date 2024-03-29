# -*- encoding: utf-8 -*-
require File.expand_path('../lib/directory_maid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bradley Smith"]
  gem.email         = ["bradleydsmith@gmail.com"]
  gem.description   = %q{A daemon that cleans up your directories}
  gem.summary       = %q{A daemon that cleans up your directories}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "directory_maid"
  gem.require_paths = ["lib"]
  gem.version       = DirectoryMaid::VERSION

  gem.add_development_dependency "rspec"
end
