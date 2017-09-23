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
    goodbye
  end # call method end

  def weather(zip_code)# prints current weather
    weather = WeatherFinder::Scrapper.basic_weather(zip_code)
    puts "**************************************"
    puts "It is currently #{weather[0]}"
    puts "But it feels like #{weather[2]}"
    puts "With a UV index of #{weather[1]}"
    puts "**************************************"
  end

  def weather_info

  end# end of weather_info

  def menu
  end

  def goodbye # prints goodbye messages and exits program
    puts "cya later nerd!"
    exit
  end
end
