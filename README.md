# EventTracker



## Installation

Add this line to your application's Gemfile:

```ruby
# It has the same name gem, i will change the name in days.
gem 'event_tracker', github:'jerry-tao/event_tracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_tracker

## Usage

### Step 1: Install the Event

```ruby
rails g event_tracker:install 
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
# The event_tracker will default to get the @post variable.
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

Working in progress.

### Support for other orms.

Working in progress.

### Custom the resource name

Working in progress.

### Handle exception

Working in progress.

### Given a resource

```
def create
  @post = Post.create
  track_event(@post)
end
```

### Render the action
 
Working in progress.

### Test

Working in progress.



## Contributing

1. Fork it ( https://github.com/jerry-tao/event_tracker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
