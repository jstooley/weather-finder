class WeatherFinder::HourlyWeather
  attr_accessor :time, :descrip, :temp, :feels, :precip, :humidity, :wind
  @@all = []
  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.humidity_under_eighty
    @@all.select { |weather| weather.humidity.to_i < 80 }
  end
end
