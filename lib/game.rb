class Game
  attr_reader :win_score, :players, :board
  attr_accessor :game_pieces

  def initialize(
    board_area,
    game_pieces,
    player_count,
    win_score,
    win_condition
  )
    @board = Array.new(board_area) { |i| i + 1 }
    @board_axis_size = Math.sqrt(board_area)
    @game_pieces = game_pieces
    @player_count = player_count
    @win_score = win_score
    @win_condition = win_condition
    @players = []
    @current_player = 0
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
    board = []
    
    create_board.each do |row|
      updated_row = []
      
      row.each_with_index do |col_obj, index|
        updated_row.push(col_obj)
        updated_row.push('|') if index < row.length - 1
      end
      
      board.push(updated_row)
    end
    
    board.each_with_index do |row, index|
      puts " #{row.join(' ')} "
      puts horizontal_line(@board_axis_size) if index < board.length - 1
    end
  end
  
  private
  
  def create_board
    new_board = []
    row = []
    
    @board.each_with_index do |elem, index|
      row.push(elem)
      
      if ((index + 1) % @board_axis_size).zero?
        new_board.push(row)
        row = []
      end
    end
    
    new_board
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
