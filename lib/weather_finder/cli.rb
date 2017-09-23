class WeatherFinder::CLI

  def call
    input = ""

    while input != "exit"
      puts "What is the zip code you would like to know the weather at?"
      puts "exit to quit"
      input = gets.chomp
      if input.to_i >= 1000 && input.to_i <= 100000 && input.length == 5
        weather(input)
      elsif (input.to_i <= 1000 || input.to_i >= 100000 || input.to_i == 0 || input.length != 5) && input.downcase != 'exit'
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

  def weather_info
  end# end of weather_info

  def menu
    input = nil
    while input != 'back'
      puts "Would you like to look at the hourly or 10 day forcast?"
      puts "Type 'hourly' or '10 day' to choose."
      puts "type 'back' to choose a different zip code."
      puts "Or type 'exit' to quit."
      input = gets.chomp
      if input.downcase == 'hourly'
      elsif input.downcase == '10 day' || input.downcase == 'ten day'
      elsif input.downcase == 'back'
      elsif input.downcase == 'exit'
      else
      end
    end
  end

  def goodbye # prints goodbye messages and exits program
    puts "cya later nerd!"
    exit
  end
end
