# PtvTimetable

A ruby gem for interacting with the PTV timetable API.


```ruby
api = PtvTimetable::API.new('devid', 'secret_key')

# Check status of API
api.health_check

# Stops nearby
api.near_me(-37.82392124423254, 144.9462017431463)

# POI
api.points_of_interest(-37.82205143151239, 144.9779160007277, -37.81393456848758, 144.9859159992726)

# Broad next departures
api.broad_next_departures(PtvTimetable::BUS, 28905)

# Specific next departures
api.specific_next_departures(PtvTimetable::BUS, 5111, 2896, 28905, 515)

```


## Installation

Add this line to your application's Gemfile:

    gem 'ptv_timetable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ptv_timetable

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/neilang/ptv_timetable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Disclaimer

This ruby gem and its developers are in no way affiliated with PTV. Any trademarks referred to are the property of their respective trademark holders. We declare no affiliation, sponsorship, nor any partnerships with any registered trademarks.
