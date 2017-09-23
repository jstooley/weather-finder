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
    hourly_doc = Nokogiri::HTML(open("https://weather.com#{hourly_url}"))
    hourly_doc.css("tbody tr").each do |row|
      time = row.css(".dsx-date").text
      day= row.css(".hourly-date").text
      descrition = row.css(".description").text
      temp = row.css(".temp").text
      feels = row.css(".feels").text
      percip = row.css(".precip").text
      humidity = row.css(".humidity").text
      temp = row.css(".wind").text
      binding.pry
    end
  end

  def self.ten_day_weather(zip_code)
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    ten_day_url = doc.css("ul li a")[2]['href']
    ten_day_doc = Nokogiri::HTML(open("https://weather.com#{ten_day_url}"))
    binding.pry
  end
end
