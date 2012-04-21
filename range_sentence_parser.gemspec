# -*- encoding: utf-8 -*-
require File.expand_path('../lib/range_sentence_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gabriel Sobrinho"]
  gem.email         = ["gabriel.sobrinho@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "range_sentence_parser"
  gem.require_paths = ["lib"]
  gem.version       = RangeSentenceParser::VERSION

  gem.add_development_dependency 'activemodel', '>= 3.0'
  gem.add_development_dependency 'rspec', '>= 2.9'
end
