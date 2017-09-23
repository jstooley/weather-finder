class WeatherFinder::CLI

  def call
    input = ""

    while input != "exit"
      puts "What is the zip code you would like to know the weather at?"
      input = gets.chomp
      if input.to_i >= 1000 && input.to_i <= 100000 && input.length == 5
        puts 'Valid'
      elsif (input.to_i <= 1000 || input.to_i >= 100000 || input.to_i == 0 || input.length != 5) && input.downcase != 'exit'
        puts "Invalid Input"
      end
    end# end of while loop
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
