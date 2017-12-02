class BestsellingGames::CLI

def call
  welcome
  list_bestsellers
end

def welcome
  puts "Welcome to the Best Selling Games App!"
  sleep 1
  print "Which system's current bestselling games would you like to see? (Xbox One, PS4, Switch, Wii U, 3DS, Switch, PC): "
end

def list_bestsellers
  input = nil
  input = gets.strip.downcase

  case input
  when "xbox one"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/xbox-one?nav=28-xu0,131e0-ffff2418")
    @bestsellers = BestsellingGames::Game.all
    puts "Current Xbox One Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end

    get_details
  when "ps4"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/playstation-4?nav=28-xu0,131dc-ffff2418")
    @bestsellers = BestsellingGames::Game.all
    puts "Current Playstation 4 Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end

    get_details
  when "switch"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/nintendo-switch?nav=28-xu0,13ffff2418-1e8")
    @bestsellers = BestsellingGames::Game.all
    puts "Current Nintendo Switch Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end

    get_details
  when "wii u"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/nintendo-wii-u?nav=131b0-ffff2418")
    @bestsellers = BestsellingGames::Game.all
    puts "Current Wii U Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end

    get_details
  when "3ds"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/nintendo-3ds?nav=131a2-ffff2418")
    @bestsellers = BestsellingGames::Game.all
    puts "Current Nintendo 3DS Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end

    get_details
  when "pc"
    BestsellingGames::Game.all.clear
    BestsellingGames::Scraper.scrape("https://www.gamestop.com/browse/games/pc?nav=138c-ffff2418")
    @bestsellers = BestsellingGames::Game.all
    puts "Current PC Bestsellers:"

    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
    
    get_details
  else
    print "Invalid input, please try again: "
    list_bestsellers
  end

end

def get_details
  input = nil
  puts ""
  print "Please enter the number of the game you want more details on: "
  input = gets.strip.downcase

  if input.to_i > 0 && input.to_i < 13
    game = @bestsellers[input.to_i - 1]
    puts "*******************************************************************"
    puts "#{game.title}:"
    puts "Published by: #{game.publisher}"
    puts "Current price: #{game.price}"
    puts "For more info, go to: #{game.url}"
    puts "*******************************************************************"
  else
    puts "Invalid input, please try again."
    get_details
  end

  decision

end

def decision
  puts "Type (1) if you would like to get details on another game from the list."
  puts "Type (2) if you would like to choose another system's bestsellers to list."
  puts "Type (3) if you would like to exit the program."

  input = nil
  input = gets.strip

  if input.to_i == 1
    get_details
  elsif input.to_i == 2
    print "Which system's current bestselling games would you like to see? (Xbox One, PS4, Wii U, 3DS, PC): "
    list_bestsellers
  elsif input.to_i == 3
    close_program
  else
    puts "Invalid input, please try again."
    decision
  end

end

def close_program
  puts "See you later!"
end

end
