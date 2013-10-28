# Container Number Validator

[![Gem Version](https://badge.fury.io/rb/container_number_validator.png)](http://badge.fury.io/rb/container_number_validator)

This gem allows you to easily validate container number fields to be valid
container numbers.

It validates Container Number according to [ISO_6346](http://en.wikipedia.org/wiki/ISO_6346)

    NYKU5824120

Also supports format where checkdigit is seperated with a dash like this

    NYKU582412-0

## Installation

Add this line to your application's Gemfile:

    gem 'container_number_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install container_number_validator

## Usage

    ContainerNumberValidator.validate('NYKU582412-0')
    #=> true

    ContainerNumberValidator.validate('NYKU582412-3')
    #=> false

### Rails 3.x / 4.x

You can use ContainerNumberValidator with any ActiveModel class, including
ActiveRecord models:

    class Container < ActiveRecord::Base
      validates :container_no, container_number: true
    end

### Edge cases

 * When no container number is present (or set to `nil`), all container numbers are considered **INVALID**.

## Contributing

### Wishlist

 Nothing specific in mind yet ;-)

If you're unsure what to contribute, contact me. :-)

### How to contribute

I prefer a pull request with added, but failing, specs to code without
specs.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See [LICENSE.txt](https://github.com/kabisaict/container_number_validator/blob/master/LICENSE.txt)
