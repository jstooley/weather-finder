class WeatherFinder::Scrapper
  attr_accessor :temp, :uv



  def self.basic_weather(zip_code)
    self.basic_scrapper(zip_code)
    @zip_code = zip_code
  end

  def self.basic_scrapper(zip_code)
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    binding.pry
    @temp = doc.css(".today_nowcard-temp").text
    @uv = doc.css(".today_nowcard-hilo div").text
    @feel_like = doc.css(".deg-feels").text
  end

end
