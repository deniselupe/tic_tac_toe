class Game
  attr_reader :players, :board
  attr_accessor :game_pieces

  def initialize
    @board = Array.new(9) { |i| i + 1 }
    @board_axis_size = 3
    @game_pieces = %w[X O]
    @win_condition = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
      [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
    ]
    @players = []
    @current_player = 0
  end

  def add_player(player)
    @players.push(player) if @players.length < 2
  end

  def player_list
    @players.each { |player| puts "Player: #{player.name}" }
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

      loop do
        player.game_piece = gets.chomp.upcase

        if !@game_pieces.include?(player.game_piece)
          puts "\nThis game piece is not an available option. Please enter a valid option:"
          next
        else
          puts "\n#{player.name} has selected: \n#{player.game_piece}\n\n"
          @game_pieces.delete(player.game_piece)
          break
        end
      end
    else
      puts "\n#{player.name} will be assigned game piece: \n#{@game_pieces[0]}\n\n"
      player.game_piece = @game_pieces[0]
      @game_pieces.delete(@game_pieces[0])
    end
  end

  def print_board
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---|---|---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---|---|---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end
end
