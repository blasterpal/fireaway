# Fireaway

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fireaway`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem


## Problem this Gem attempting to solve

HTTP is the focus of this idea. For a small team with enough on their plate already, avoiding another component or dependency into stack and ops is costly. 
In this example, the cloud and PaaS services are not an option, the app lives on our hardware for business reasons. I can't use RabbitMQ as a service. 



# Implementation idea

With service architecture, some type of message passing is required between applications (sharing a DB is an anti-pattern). A goal is implementation should be opaque.
However the synchronous versus asynchronous nature of HTTPS and message queues respectively, makes the implementation being generic a little harder.

One of the first problems when you consider using HTTP as a means of distributed messaging, what if the service is down? 
Then your calls either throw exceptions or you have to write code to account for service being down, which actually you should anyway.

The wonderment is 'why can't you use HTTP but also have 'some' durability'? Even better, you can retry HTTP calls and even replay messages later. Smells similar to a queue.
For the purposes of simplicity, I need to ignore other features of queues like fanout,etc. 

Record the message into a journal that can be replayed. The "messages" are domain specific to this app anyway.
So why not let it keep the failures and present in admin for this app to replay?


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fireaway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fireaway

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fireaway.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

