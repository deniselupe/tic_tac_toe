class Player
  attr_reader :name, :game_piece, :score

  def initialize(game)
    @name = ''
    @game_piece = ''
    @game = game
    @score = game.start_score
    player_info
    @game.add_player(self)
  end
  
  def increment_score
    @score += 1 if score < game.win_score
    puts "#{name} wins!" if score == game.win_score
  end
  
  private
  
  def player_info
    puts "Player #{@game.players.length + 1} what is your name?"
    @name = gets.chomp.upcase
    sleep 1
    puts "\nGame pieces available:"
    @game.avail_pieces.each { |piece| puts piece }
    assign_game_piece
    sleep 1
    puts ''
  end
  
  def assign_game_piece
    if @game.avail_pieces.length > 1
      puts "\nWhat is your game piece?"

      loop do
        @game_piece = gets.chomp.upcase

        if !@game.game_pieces.keys.include?(@game_piece) || !@game.avail_pieces.include?(@game_piece)
          puts "\nThis game piece is not an available option. Please enter a valid option."
          next
        else
          @game.game_pieces[@game_piece] = self
          puts "\nYou have selected:"
          puts @game_piece
          sleep 1
          break
        end
      end
    else
      puts "\nYou will be assigned game piece:"
      puts @game.avail_pieces[0]
      @game_piece = @game.avail_pieces[0]
      @game.game_pieces[@game_piece] = self
      sleep 1
    end
  end
end
