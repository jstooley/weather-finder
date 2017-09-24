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
    hourly_array = []

    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    hourly_url = doc.css("ul li a")[1]['href']
    hourly_doc = Nokogiri::HTML(open("https://weather.com#{hourly_url}"))
    hourly_doc.css("tbody tr").each_with_index do |row, i|

      time = row.css(".dsx-date").text
      descrip = row.css(".description").text
      temp = row.css(".temp").text
      feels = row.css(".feels").text
      precip = row.css(".precip").text
      humidity = row.css(".humidity").text
      wind = row.css(".wind").text

      hourly_array[i] = [time,descrip,temp,feels,precip,humidity,wind]

    end
    hourly_array

  end

  def self.ten_day_weather(zip_code)
    ten_day_array = []
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/#{zip_code}:4:US"))
    ten_day_url = doc.css("ul li a")[2]['href']
    ten_day_doc = Nokogiri::HTML(open("https://weather.com#{ten_day_url}"))
    ten_day_doc.css("tbody tr").each_with_index do |row, i|

      time = row.css(".dsx-date").text
      descrip = row.css(".description").text
      temp = row.css(".temp").text
      feels = row.css(".feels").text
      precip = row.css(".precip").text
      humidity = row.css(".humidity").text
      wind = row.css(".wind").text

      ten_day_array[i] = [time,descrip,temp,feels,precip,humidity,wind]

    end
  end
end
