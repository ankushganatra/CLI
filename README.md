# Cli

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cli`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cli

## Usage

You should have mysql installed. For now username and password are kept as 'root' and 'p@ssw0rd' respectively. Schema name 'development'

Run:
    ./bin/cli
        -- Prints commands available
    ./bin/cli list
        -- Prints lists of available rooms stored
    ./bin/cli new
        -- Allows you to create new entry for room (Keep track of the Id printed while creating new.)
        -- If you skip the entries with CTRL+C, you can contiue with ./bin/cli continue <id>
    ./bin/cli continue <id>
        -- Allows user to continue entering data from where he left

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ankushganatra/cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

