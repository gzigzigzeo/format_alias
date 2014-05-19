# Format Alias

Provides virtual attributes to get/set certain model values in/to human
readable format.

## Date formatting

```ruby
class Foo
  extend FormatAlias

  attr_accessor :created_at
  date_format_alias :created_at, '%d.%m.%Y'
end

bar = Foo.new
bar.created_at_formatted = '12.01.2001'
bar.created_at # => Sat, 01 Dec 2001
```

Accepts options:
* `:suffix` - `formatted` by default
* `:getter_name` - name of a getter method
* `:setter_name` - name of a setter method (without '=')

## Setting polymorphic attribute

Useful when you want to set variables from such select:

```html
<select name="imageable">
  <option value="Image:3">Image</option>
  <option value="Banner:1">Banner</option>
  ...
</select>
```
```ruby
class Foo < ActiveRecord::Base
  extend FormatAlias
  belongs_to :imageable
  polymorphic_alias :imageable
end

bar = Foo.new
bar.imageable_formatted = "Image:3"
bar.imageable_id   # => 3
bar.imageable_type # => "Image"
```

## Roll your own

## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq-batching'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-batching

## Contributing

1. Fork it ( http://github.com/gzigzigzeo/format_alias/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request