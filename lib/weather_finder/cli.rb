class WeatherFinder::CLI

  def call
    input = ""
    while input != "exit"
      puts "What is the zip code you would like to know the weather at"
      input = gets.chomp
    end
    goodbye
  end # call method end

  def weather# prints all deals of a chosen site
  end

  def weather_info(choice)
     # will print the chosen deals info
  end# end of deal_info

  def menu
  end # end menu method

  def goodbye # prints goodbye messages and exits program
    puts "cya later nerd!"
    exit
  end
end
