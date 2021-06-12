# Initials

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'initials'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install initials

## Usage

Call `Initials.svg("Morty Smith")` anywhere to get a colorful initials avatar SVG as string.

### Rails

**Coming soon:**

In Rails you can also use this helper:
```ruby
user_avatar(user.fullname) # or any other string
```

You can also use this shorthand:
```ruby
user_avatar(user) # or any other object
```

The gem  trys the following methods on the object to use for initials generation: `name`, `fullname`, `email`, in this order.

### Options

You can pass the following options into `Initials.svg` and the `user_avatar` helper:

```rb
user_avatar("", size: 96)
```

This sets `width` and `height` in the SVG. Note that you can also use CSS to make the SVG have different sizes in different places of your HTML, of course.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thutterer/initials.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
