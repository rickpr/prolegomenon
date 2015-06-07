# Prolegomenon
>> "a critical or discursive introduction to a book"

[![Gem Version](https://badge.fury.io/rb/prolego.svg)](http://badge.fury.io/rb/prolego)

This is a gem intended for UNM to interface Ruby with Prolog.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prolego'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prolego

## Usage

Initiate a Prolog Query as a Ruby object. This expects a file to have some
predicates defined that it can use from the command line.

```ruby
prolog = Prolego::Query.new("Top.pl")
```

If you would like an exception to be thrown if Prolog fails, use `whiny: true`

```ruby
prolog = Prolego::Query.new("Top.pl", whiny: true)
```


After initializing this, make queries against your Prolog file. Note this runs
Prolog from the interactive mode, so no need to compile Prolog. The command
method takes two arguments, the predicate name and the argument list. The
argument list expects an **array**, so if you have arrays within your arguments,
nest them.

```ruby
prolog.command("ce",["BS",[["MATH 162","A"],["CE 160L","A"]]])
```

To get the output of the command, use the `output` method:
```ruby
prolog.output
```

To get anything that went into STDERR (like warnings), use the `error` method:
```ruby
prolog.error
```

We have a special method called `epilog` to get our formatted output. This
splits our Prolog output for our application, based on the last command sent
from the current Prolegomenon object. This expects lists to be returned. We are
using `writeq` to do this, then the gem parses them using the JSON gem.

```ruby
prolog.epilog
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/prolego/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

> Inspired by Dr. Chris Lamb
