# EventTrack



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'event_track', github:'jerry-tao/event_track'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_track

## Usage

### Step 1: Install the Event

```ruby
rails g event_track:install 
```

### Step 2: Track your controller

```
class PostsController < ApplicationController
  track_event
end
```

Enjoy it.

### Notice

- It will use controller_name to get the track target and use current_user as the owner as default.

```ruby
class PostsController < ApplicationController
end
# The event_track will default to get the @post variable.
```

- It will only track POST, PUT and DELETE actions.

- It doesn't used for batch work.

```ruby
collection do
  put :update_all
end

def update_all
  Post.update_all
end
# The event_track do not track this.
```

## Config

### Use a different table name

```ruby
#/config/initializers/event_track.rb
EventTrack.configure do |config|
  config.table_name = 'activities'
end
```
### Support for other orms.

Working in progress.

### Custom the resource name

```ruby
class PostsController < ApplicationController
  track_event :article
  # So the event_track will try to get @article as track target 
end
```

### Handle exception

Working in progress.

### Given a resource

```
def create
  @post = Post.create
  track_event(@post)
  #track_event(@post,meta:{author:'hello'})
end

```

### Render the action
 
Working in progress.

### Test

Working in progress.

### The Event of Event

If you want to something when an event creat.

```ruby
#app/subscribers/posts_subscriber.rb
class PostsSubscriber < EventTrack::Subscriber
  def create(event) # The same name with you action.
    #Do something...
  end
end
```

And attach it to the controller:

```ruby
#config/initializers/event_track.rb
PostsSubscriber.attach_to :posts # The same name of your controller


## Contributing

1. Fork it ( https://github.com/jerry-tao/event_track/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
