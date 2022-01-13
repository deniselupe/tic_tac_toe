class Player
  attr_accessor :name, :game_piece, :score

  def initialize(game)
    @name = ''
    @game_piece = ''
    @game = game
    @score = 0
    @game.add_player(self)
  end
end
