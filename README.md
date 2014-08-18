# DotNotation

Simple-ish enumberable-simplifier. Useful for APIs like Twitter, etc

If you have a hash or an array or something that quacks like one, you can do stuff
example:

```ruby
  require 'dot_notation'
  h = {a: {b: {c: [{d: 'hi'}]}}}
  h.extend(DotNotation)
  h.dot('a.b.c.0.d')
  #=> 'hi'
  h.dot('a.b.c.foo.bar.bz.whatever.124.whocares')
  #=> nil
```

## Installation

Add this line to your application's Gemfile:

    gem 'dot_notation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dot_notation

## Contributing

1. Fork it ( http://github.com/<my-github-username>/dot_notation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
