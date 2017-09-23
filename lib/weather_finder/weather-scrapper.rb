class WeatherFinder::Scrapper
  attr_accessor :temp, :uv, :feels_like



  def self.basic_weather(zip_code)
    self.basic_scrapper(zip_code)
    [@temp,@uv,@feel_like]
  end

  def self.basic_scrapper(zip_code)
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    @temp = doc.css(".today_nowcard-temp").text
    @uv = doc.css(".today_nowcard-hilo div").text
    @feel_like = doc.css(".deg-feels").text
    @uv.gsub!("UV Index ", "")
  end

  def self.hourly_weather(zip_code)
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    hourly_url = doc.css("ul li a")[1]['href']
    hourl_doc = Nokogiri::HTML(open("#{hourly_url}"))
    binding.pry
  end
end
