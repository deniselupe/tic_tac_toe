class Game
	def initialize(player_count, start_score, win_score)
		@player_count = player_count
		@start_score = start_score
		@win_score = win_score
		@players = []
	end
	
	def add_player(player)
		@players.push(player)
  end
end


class Player
  attr_reader :name
  
	def initialize(name, game_piece)
		@name = name
		@game_piece = game_piece
    @game = ''
    @score = ''
	end
  
  def increment_score
    @score++ if score < 3
    puts "#{name} wins!" if score == 3
  end
  
  private
  
  def score
    @score
  end
end

def game_start
  tic_tac_toe = Game.new(2, 0, 3)
  player1 = Player.new('Denise', 'X')
  player2 = Player.new('Alex', 'O')
  tic_tac_toe.add_player(player1)
  tic_tac_toe.add_player(player2)
end