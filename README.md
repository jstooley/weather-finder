# WeatherFinder

Goes to weather.com and finds the weather based on your zip code. Gives a basic overview then can go get an hourly forecast or 10 day forecast.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weather_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather_finder

## Usage

1. `basic_weather`

Based on the zip code if you would like to get [Current Temp, UV Index, Feels Like]

```ruby
WeatherFinder::Scrapper.basic_weather(94041)

#=> ["66°", "0 of 10", "66°"]
```

2. `hourly_weather`

Based on the zip code if you would like to get the hourly weather. Data will be returned as two dimensional array:
[[time, description, temperature, feels like, precipitation, humidity, wind], [.......],[.......]]

```ruby
WeatherFinder::Scrapper.hourly_weather(94041)

#=> [["11:30 am", "Mostly Sunny", "74°", "74°", "0%", "17%", "NNE 7 mph "], ["12:00 pm", "Mostly Sunny", "76°", "76°", "0%", "16%", "NNE 6 mph "], ["1:00 pm", "Mostly Sunny", "78°", "78°", "0%", "14%", "NNE 6 mph "], ...., ....]

```

3. `ten_day_weather`

Based on the zip code if you would like to get the 10 day weather. Data will be returned as two dimensional array:
[[day, description, high, low, precipitation, wind, humidity],[.......],[.......]]

```ruby
WeatherFinder::Scrapper.ten_day_weather(94041)

#=> [["Tonight", "Clear", "--", "55°", "0%", "42%", "NNW 6 mph "], ["Fri", "Sunny", "85°", "54°", "0%", "29%", "N 9 mph "], ["Sat", "Sunny", "81°", "54°", "0%", "45%", "NNW 9 mph "], ....., .....]

```

4. The `weather_finder` gem also provides a command line interface(CLI). To use the CLI:

```ruby
w = WeatherFinder::CLI.new

w.call

=begin
What is the zip code you would like to know the weather at?
exit to quit
94041
**************************************
It is currently 74°
But it feels like 74°
With a UV index of 5 of 10
**************************************
Would you like to look at the hourly or 10 day forecast?
Type 'hourly' or '10 day' to choose.
type 'back' to choose a different zip code.
Or type 'exit' to quit.
=end

```
To bypass the interactive menu you can simply do:

```ruby

w.weather_hourly(94041)
w.weather_ten_day(94041)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jstooley'/weather_finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WeatherFinder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'jstooley'/weather_finder/blob/master/CODE_OF_CONDUCT.md).
