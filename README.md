# UseUrandom
Turns out, Ruby's SecureRandom makes some poor design decisions.
This gem monkey patches SecureRandom to use /dev/urandom.

# UPDATE

This Gem is largely pointless now that modern versions of Ruby use a secure entry source.

See this bug: https://bugs.ruby-lang.org/issues/9569



## FAQ
### Why write this and what is wrong with SecureRandom?
There are a lot of material involved in answering this, but the best starting point is [this HN thread, from which this gem was inspired](https://news.ycombinator.com/item?id=11624890)
### What about Random.raw_seed?
The purpose of this gem, as per the name, is to use /dev/urandom. That function takes several code paths, one possibility of which, is reading /dev/urandom. raw_seed() meanwhile, is written in C, and packed with #define's that control flow. I don't intend on auditing it line by line, and the fact this gem is necessary reduces needed limits my confidence in it.
### But my server will run out of entropy!
If you truly believe that, don't use this gem. Definitely don't open an issue demonstrating ignorance.

## Usage

This gem is in the super pre-alpha stage and shouldn't be used.
Just require it in your application:

```ruby
require 'use_urandom'
```

Any calls to SecureRandom will automatically get redirected to a read on /dev/urandom. Any failures get pushed back to the original code, with a warning raised. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/technion/use_urandom.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

