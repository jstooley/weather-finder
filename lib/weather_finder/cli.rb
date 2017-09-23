class WeatherFinder::CLI
USA_ZIP_CODES = [[*99501..99950],[*35004..36925],[*71601..72959],
[*75502..75502],[*85001..86556],[*90001..96162],[*80001..81658],
[*6001..6389],[*6401..6928],[*20001..20039],[*20042..20599],
[*19701..19980],[*32004..34997],[*30001..31999],[*39901..39901],
[*96701..96898],[*50001..52809],[*68119..68120],[*83201..83876],
[*60001..62999],[*46001..47997],[*66002..67954],[*40003..42788,
[*70001..71232],[*71234..71497],[*1001..2791],[*5501..5544],[*20331..20331],
[*20335..20797],[*20812..21930],[*3901..4992],[*48001..49971],[*55001..56763],
[*63001..65899],[*38601..39776],[*71233..71233],[*59001..59937],
[*27006..28909],[*58001..58856],[*68001..68118],[*68122..69367],
[*33031..3897],[*7001..8989],[*87001..88441],[*88901..89883],
[*6390..6390],[20799]]


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
    puts "Hourly weather"
  end# end of weather_hourly

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
        puts "10 day data"
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

    USA_ZIP_CODES.each do |state|
      state.each do |zip|
        if zip == zip_code.to_i
          valid = true
        end
      end
    end
    valid
  end#end of zip code validation
end
