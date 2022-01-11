require_relative './lib/game.rb'
require_relative './lib/player.rb'
  
def game_start
  tic_tac_toe = Game.new(9, {'X' => nil, 'O' => nil}, 2, 0, 3)
  player1 = Player.new(tic_tac_toe)
  player2 = Player.new(tic_tac_toe)
  tic_tac_toe.player_list
  tic_tac_toe.print_board
end

game_start
