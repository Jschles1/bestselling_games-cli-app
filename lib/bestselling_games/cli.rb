class BestsellingGames::CLI

def call
  welcome
  list_bestsellers
  get_details
  decision
end

def welcome
  puts "Welcome to the Best Selling Games App!"
  sleep 1
  print "Which system's current bestselling games would you like to see? (Xbox One, PS4, Wii U, 3DS, PC): "
end

def list_bestsellers
  input = nil
  input = gets.strip.downcase

  if input == "xbox one"
    @bestsellers = BestsellingGames::Game.xbox_scrape
    puts "Current Xbox One Bestsellers:"
    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
  elsif input == "ps4"
    @bestsellers = BestsellingGames::Game.ps4_scrape
    puts "Current Playstation 4 Bestsellers:"
    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
  elsif input == "wii u"
    @bestsellers = BestsellingGames::Game.wiiu_scrape
    puts "Current Wii U Bestsellers:"
    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
  elsif input == "3ds"
    @bestsellers = BestsellingGames::Game.ds_scrape
    puts "Current Nintendo 3DS Bestsellers:"
    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
  elsif input == "pc"
    @bestsellers = BestsellingGames::Game.pc_scrape
    puts "Current PC Bestsellers:"
    @bestsellers.each.with_index(1) do |game, i|
      puts "#{i}. #{game.title}"
    end
  elsif input == "exit"
    close_program
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

  if input.to_i > 0
    game = @bestsellers[input.to_i-1]
    puts "*******************************************************************"
    puts "#{game.title}:"
    puts "Published by: #{game.publisher}"
    puts "Rating (Out of 10): #{game.rating}"
    puts "Current price: #{game.price}"
    puts "For more info, go to: #{game.url}"
    puts "*******************************************************************"
  else
    puts "Invalid input, please try again."
    get_details
  end
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

end

end
