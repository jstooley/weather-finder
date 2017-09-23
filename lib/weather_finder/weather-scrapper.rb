class WeatherFinder::Scrapper
  attr_accessor :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

end
