class Game
  def initialize
    @board = Array.new(9) { |i| i + 1 }
    @game_pieces = %w[X O]
    @players = []
    @current_player = 0
    @game_over = false
    @win_condition = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
  end

  def game_start
    2.times { @players.push(Player.new) }
    player_info
    play_loop
  end

  private

  def play_loop
    until @game_over == true
      player_list
      print_board
      select_position(@players[@current_player])
      win_check
      toggle_player
    end
  end

  def player_info
    @players.each_with_index do |player, index|
      puts "Player #{index + 1} what is your name?\n"
      player.name = gets.chomp.capitalize
      puts "\nGame pieces available:"
      @game_pieces.each { |piece| puts piece }
      assign_piece(player)
    end
  end

  def assign_piece(player)
    if @game_pieces.length > 1
      puts "\n#{player.name}, what is your game piece?"
      player.game_piece = gets.chomp.upcase

      until @game_pieces.include?(player.game_piece)
        puts "\nThis game piece is not an available option. Please enter a valid option:"
        player.game_piece = gets.chomp.upcase
      end

      puts "\n#{player.name} has selected: \n#{player.game_piece}\n\n"
      @game_pieces.delete(player.game_piece)
    else
      puts "\n#{player.name} will be assigned game piece: \n#{@game_pieces[0]}\n\n"
      player.game_piece = @game_pieces[0]
      @game_pieces.delete(@game_pieces[0])
    end
  end

  def player_list
    @players.each { |player| puts "Player: #{player.name}" }
  end

  def print_board
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---|---|---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---|---|---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end

  def toggle_player
    case @current_player
    when 0 then @current_player = 1
    when 1 then @current_player = 0
    end
  end

  def select_position(player)
    puts "#{player.name}, choose a position from the available positions on the board:"
    position = gets.chomp.to_i - 1

    until @board[position].instance_of?(Integer)
      puts "\nThis position is not available. Please choose again:"
      position = gets.chomp.to_i - 1
    end

    @board[position] = player.game_piece
    puts ''
  end

  def win_check
    if winner?(@players[@current_player])
      puts "#{@players[@current_player].name} wins!"
      @game_over = true
      print_board
    elsif board_full?
      puts "Game over. It's a draw."
      @game_over = true
      print_board
    end
  end

  def winner?(player)
    @win_condition.any? do |condition|
      condition.all? { |position| @board[position] == player.game_piece }
    end
  end

  def board_full?
    @board.all? { |position| position.instance_of?(String) }
  end
end
