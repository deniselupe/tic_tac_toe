class Player
  attr_reader :name, :game_piece, :score

  def initialize(game)
    @name = ''
    @game_piece = ''
    @game = game
    @score = 0
    player_info
    @game.add_player(self)
  end
  
  def increment_score
    @score += 1 if score < @game.win_score
    puts "#{name} wins!" if @score == @game.win_score
  end
  
  private
  
  def player_info
    puts "Player #{@game.players.length + 1} what is your name?"
    @name = gets.chomp.upcase
    puts "\nGame pieces available:"
    @game.avail_pieces.each { |piece| puts piece }
    assign_game_piece
  end
  
  def assign_game_piece
    if @game.avail_pieces.length > 1
      puts "\nWhat is your game piece?"

      loop do
        @game_piece = gets.chomp.upcase

        if !@game.avail_pieces.include?(@game_piece)
          puts "\nThis game piece is not an available option. Please enter a valid option:"
          next
        else
          @game.game_pieces[@game_piece] = self
          puts "\nYou have selected: \n#{@game_piece}"
          puts ''
          break
        end
      end
    else
      puts "\nYou will be assigned game piece: \n#{@game.avail_pieces[0]}"
      @game_piece = @game.avail_pieces[0]
      @game.game_pieces[@game_piece] = self
      puts ''
    end
  end
end
