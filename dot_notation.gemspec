# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dot_notation/version'

Gem::Specification.new do |spec|
  spec.name          = "dot_notation"
  spec.version       = DotNotation::VERSION
  spec.authors       = ["Joshua Szmajda"]
  spec.email         = ["josh@optoro.com"]
  spec.summary       = %q{An enumerable simplifier. Busts your method cache, I guess.}
  spec.description   = %q{Simple-ish enumberable-simplifier. Useful for APIs like Twitter, etc

If you have a hash or an array or something that quacks like one, you can do stuff

example:
    require 'dot_notation'
    h = {a: {b: {c: [{d: 'hi'}]}}}
    h.extend(DotNotation)
    h.dot('a.b.c.0.d')
    #=> 'hi'
    h.dot('a.b.c.foo.bar.bz.whatever.124.whocares')
    #=> nil}
  spec.homepage      = "https://github.com/joshsz/dot_notation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
