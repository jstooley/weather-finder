class WeatherFinder::CLI

  def call
    input = ""

    while input != "exit"
      puts "What is the zip code you would like to know the weather at?"
      puts "exit to quit"

      input = gets.chomp
      state = self.zip_code?(input)#check zip code

      if state && input.length == 5
        self.weather(input)
      elsif !state && input.downcase != 'exit'
        puts "Invalid Input"
      end
    end# end of while loop
    self.goodbye
  end # call method end

  def weather(zip_code)# prints current weather
    weather = WeatherFinder::Scrapper.basic_weather(zip_code)

    puts "**************************************"
    puts "It is currently #{weather[0]}"
    puts "But it feels like #{weather[2]}"
    puts "With a UV index of #{weather[1]}"
    puts "**************************************"

    self.menu(zip_code)
  end

  def weather_hourly(zip_code)

    hourly_weather = WeatherFinder::Scrapper.hourly_weather(zip_code)

    puts "------------------------------------------------------------------------"
    hourly_weather.each do |row|
      print "Time:#{row[0]} "
      print "Description:#{row[1]} "
      print "Temp:#{row[2]} "
      print "Feels Like:#{row[3]} "
      print "Percip:#{row[4]} "
      print "Humidity:#{row[5]} "
      puts  "Wind:#{row[6]} "
      puts "------------------------------------------------------------------------"
    end
  end# end of weather_hourly

  def weather_ten_day(zip_code)

    ten_day_weather = WeatherFinder::Scrapper.ten_day_weather(zip_code)

    puts "------------------------------------------------------------------------"
    ten_day_weather.each do |row|
      print "Day:#{row[0]} "
      print "Description:#{row[1]} "
      print "High:#{row[2]} "
      print "Low:#{row[3]} "
      print "Percip:#{row[4]} "
      print "Humidity:#{row[5]} "
      puts  "Wind:#{row[6]} "
      puts "------------------------------------------------------------------------"
    end
  end# end of weather ten day

  def menu(zip_code)
    input = ""

    while input.downcase != 'back' || input.downcase != 'exit'

      puts "Would you like to look at the hourly or 10 day forcast?"
      puts "Type 'hourly' or '10 day' to choose."
      puts "type 'back' to choose a different zip code."
      puts "Or type 'exit' to quit."
      input = gets.chomp

      if input.downcase == 'hourly'
        self.weather_hourly(zip_code)
      elsif input.downcase == '10 day' || input.downcase == 'ten day'
        self.weather_ten_day(zip_code)
      elsif input.downcase == 'back'
        self.call
      elsif input.downcase == 'exit'
        self.goodbye
      else
        puts "Do not understand entry."
        puts "Please enter a valid choice."
      end#end of if
    end#end of while
  end#end of menu

  def goodbye # prints goodbye messages and exits program
    puts "Enjoy your day!"
    exit
  end

  def zip_code?(zip_code) #takes all zip codes and compares them to given zip
    valid = false
    zip_path = File.join(File.dirname(__FILE__), '/all_usa_zip.txt')
    File.open(zip_path).each do |zip| #read from file to test valid zip
      if zip.to_i == zip_code.to_i
        valid = true
      end
    end

    valid
  end#end of zip code validation
end
