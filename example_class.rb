class ExampleWorker
  include Fireaway::Worker
  # better Config DSL later
  fireaway :http,
    adapter_options: {jwt_secret: '123'},
    publish: {uri: 'http://remote.dev/api/to-consume', retries: 3, backoff: 3},
    consume: {uri: 'http://myapp.dev/callbacks/this-context'}
    # a nice DSL for http resources that is RACK aware would be nice, but for now KISS
  
  # a callback  
  def before_publish(message)
    # do any business logic
    # this calls the adapter.publish(message) afterware
    message
  end

  def consume(message)
    # do business work when message is received
  end

end
