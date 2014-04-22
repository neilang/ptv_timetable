# PTV Timetable Gem [![Build Status](https://secure.travis-ci.org/neilang/ptv_timetable.png?branch=master)](https://travis-ci.org/neilang/ptv_timetable)

A ruby gem for interacting with the [PTV timetable API](https://www.data.vic.gov.au/raw_data/ptv-timetable-api/6056) version 2.0.

## Usage

To use this gem you will need to request a `devid` and `secret key`. Instructions on how to do this are available in the [API specificationn](https://www.data.vic.gov.au/raw_data/ptv-timetable-api/6056).


For all API calls you will need a valid _devid_ and _secret_key_.

```ruby
api = PtvTimetable::API.new('devid', 'secret_key')
```

### Health Check

The Health Check will test a number of the key services that deliver the PTV Timetable API and let you know if there are any problems with connectivity, availability or reachability.

```ruby
api.health_check
```

N.B. Calling the Health Check API at the start of each sequence of APIs flushes out any system problems.

### Stops Nearby

Stops Nearby returns up to 30 stops nearest to a specified coordinate.

```ruby
api.near_me(-37.82392124423254, 144.9462017431463)
```

### Transport POIs by Map

Transport POIs by Map returns a set of locations consisting of stops and/or myki ticket outlets (collectively known as points of interest) within a region demarcated on a map through a set of latitude and longitude coordinates.

```ruby
api.points_of_interest(-37.82205143151239, 144.9779160007277, -37.81393456848758, 144.9859159992726)

# Or just myki ticket outlets
api.points_of_interest(-37.82205143151239, 144.9779160007277, -37.81393456848758, 144.9859159992726, PtvTimetable::TICKET_OUTLET)
```



### Search

The Search API returns all stops and lines that match the input search text.

```ruby
api.search('Alamein')
```

### Broad Next Departures

Broad Next Departures returns the next departure times at a prescribed stop irrespective of the line and direction of the service.

For example, if the stop is Camberwell Station, Broad Next Departures will return the times for all three lines (Belgrave, Lilydale and Alamein) running in both directions (towards the city and away from the city).

```ruby
api.broad_next_departures(PtvTimetable::BUS, 28905)
```

# Specific Next Departures

Specific Next Departures returns the times for the next departures at a prescribed stop for a specific mode, line and direction.

For example, if the stop is Camberwell Station, Specific Next Departures returns only the times

```ruby
api.specific_next_departures(PtvTimetable::BUS, 5111, 2896, 28905, 515)
```

### Stopping Pattern

The Stopping Pattern API returns the stopping pattern for a specific run (i.e. transport service) from a prescribed stop at a prescribed time. The stopping pattern is comprised of timetable values ordered by stopping order.

```ruby
api.stopping_pattern(PtvTimetable::BUS, 1464, 1108, '2013-11-13T05:24:25Z')
```

### Stops on a Line

The Stops on a Line API returns a list of all the stops for a requested line, ordered by location name.

```ruby
api.line_stops(PtvTimetable::BUS, 1818)
```

## Installation

Add this line to your application's Gemfile:

    gem 'ptv_timetable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ptv_timetable


## Contributing

1. Fork it ( http://github.com/neilang/ptv_timetable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Disclaimer & Attribution

This ruby gem and it's developers are in no way affiliated with Public Transport Victoria (PTV). Any trademarks referred to are the property of their respective trademark holders. We declare no affiliation, sponsorship, nor any partnerships with any registered trademarks.

The API specification titled "Timetable API" was released under the Creative Commons license. I attribute this publication - _Source: Licensed from Public Transport Victoria under a Creative Commons Attribution 3.0 Australia Licence._
