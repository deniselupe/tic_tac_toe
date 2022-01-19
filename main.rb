require_relative './lib/game.rb'
require_relative './lib/player.rb'

def play
  Game.new.game_start
  puts "\nWould you like to play again? (Y or N)"
  response = gets.chomp.upcase

  until response == 'Y' || response == 'N'
    puts "\nThat is not a valid response. Would you like to play again? (Y or N)"
    response = gets.chomp.upcase
  end

  if response == 'Y'
    play
  else
    puts "\nThanks for playing!"
  end
end

play
