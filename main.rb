require_relative './lib/game.rb'
require_relative './lib/player.rb'
  
def game_start
  game_pieces = {'X' => nil, 'O' => nil}
  win_condition = [
    [1,2,3],[4,5,6],[7,8,9],[1,4,7],
    [2,5,8],[3,6,9],[1,5,9],[3,5,7] 
  ]
  tic_tac_toe = Game.new(9, game_pieces, 2, 3, win_condition)
  player1 = Player.new(tic_tac_toe)
  player2 = Player.new(tic_tac_toe)
  tic_tac_toe.player_list
  tic_tac_toe.print_board
end

game_start
