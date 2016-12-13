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

  end
end

def get_details

end

def decision

end

def close_program

end

end
