class Game
  attr_reader :start_score, :win_score, :players
  attr_accessor :game_pieces

  def initialize(board_area, game_pieces, player_count, start_score, win_score)
    @board = []
    @game_pieces = game_pieces
    @board_axis_size = Math.sqrt(board_area)
    @player_count = player_count
    @start_score = start_score
    @win_score = win_score
    @players = []
    create_board
  end

  def add_player(player)
    @players.push(player) if @players.length < @player_count
  end

  def player_list
    @players.each { |player| puts "Player: #{player.name}" }
    puts ''
  end
  
  def avail_pieces
    @game_pieces.select { |_obj, val| val.nil? }.keys
  end

  def print_board
    @board.each_with_index do |row, index|
      puts " #{row.join(' ')} "
      puts horizontal_line(@board_axis_size) if index < @board.length - 1
    end
    puts ''
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
