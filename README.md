# SilentPing

Provides an /ping endpoint for Rack health check, that doesn't get logged.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'silent_ping'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silent_ping

## Usage

You don't have to do anything else.

## Development

To disable the `/ping` endpoint without removing the gem from you Gemfile, you can add `config.silent_ping = false` to your `application.rb`.  

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blinkist/silent_ping. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SilentPing project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/silent_ping/blob/master/CODE_OF_CONDUCT.md).
