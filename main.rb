class Game
  def initialize(board_area, player_count, start_score, win_score)
    @board = []
    @board_axis_size = Math.sqrt(board_area)
    @player_count = player_count
    @start_score = start_score
    @win_score = win_score
    @players = []
    create_board
  end

  def add_player(player)
    @players.push(player) if @players.length < 2
  end

  def player_list
    @players.each { |player| puts "Player: #{player.name}" }
    puts ''
  end

  def print_board
    @board.each_with_index do |row, index|
      puts " #{row.join(' ')} "
      puts horizontal_line(@board_axis_size) if index < @board.length - 1
    end
  end
  
  private
  
  def create_board
    board = Array.new(@board_axis_size) { Array.new(@board_axis_size) }
    position = 1
    
    board.each do |row|
      updated_row = []

      row.each_with_index do |_col_obj, index|
        updated_row.push(position)
      
        position += 1
        updated_row.push('|') if index < row.length - 1
      end

      @board.push(updated_row)
    end
  end
  
  def horizontal_line(size)
    line = ''
  
    for i in 1..size
      line += '---'
      line += '|' if i < size
    end

    line
  end
end

class Player
  attr_reader :name, :game_piece, :score

  def initialize(name, game_piece)
    @name = name
    @game_piece = game_piece
    @game = ''
    @score = '0'
  end
  
  def increment_score
    @score += 1 if score < 3
    puts "#{name} wins!" if score == 3
  end
end
  
def game_start
  tic_tac_toe = Game.new(9, 2, 0, 3)
  player1 = Player.new('Denise', 'X')
  player2 = Player.new('Alex', 'O')
  tic_tac_toe.add_player(player1)
  tic_tac_toe.add_player(player2)
  tic_tac_toe.player_list
  tic_tac_toe.print_board
end

game_start
