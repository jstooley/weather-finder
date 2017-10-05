class WeatherFinder::Scrapper
  attr_accessor :temp, :uv, :feels_like, :ten_day_arraay, :hourly_array

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

    hourly_doc.css("tbody tr").each_with_index do |row, i|
      hourly = WeatherFinder::HourlyWeather.new
      hourly.time = row.css(".dsx-date").text
      hourly.descrip = row.css(".description").text
      hourly.temp = row.css(".temp").text
      hourly.feels = row.css(".feels").text
      hourly.precip = row.css(".precip").text
      hourly.humidity = row.css(".humidity").text
      hourly.wind = row.css(".wind").text

    end

  end

  def self.ten_day_weather(zip_code)
    @ten_day_array = []
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    ten_day_url = doc.css("ul li a")[2]['href']
    ten_day_doc = Nokogiri::HTML(open("https://weather.com#{ten_day_url}"))
    ten_day_doc.css("tbody tr").each_with_index do |row, i|

      time = row.css(".date-time").text
      descrip = row.css(".description").text
      high = row.css(".temp span")[0].text
      low = row.css(".temp span")[2].text
      precip = row.css(".precip").text
      humidity = row.css(".humidity").text
      wind = row.css(".wind").text

      @ten_day_array[i] = [time,descrip,high,low,precip,humidity,wind]
    end
    @ten_day_array
  end#end of ten day weather

end
