# require_relative '../board/board'
# require_relative '../player/player'

# class Game
#   def initialize
#     @board = Board.new
#     @players = [Player.new('X'), Player.new('O')]
#     @current_player_index = 0
#   end

#   def play
#     @board.display until @board.full? || @board.winner?

#     current_player = @players[current_player_index]
#     move = current_player.get_move(@board)
#     @board.make_move(move, current_player.mark)

#     @current_player_index = (@current_player_index + 1) % 2

#     @board.display
#     if @board.winner?
#       puts "Player #{@players[(@current_player_index - 1) % 2].mark} wins!"
#     else
#       puts "It's a tie!"
#     end
#   end
# end

require_relative '../board/board'
require_relative '../player/player'

class Game # rubocop:disable Style/Documentation
  def initialize
    @board = Board.new
    @players = [Player.new('X'), Player.new('O')]
    @current_player_index = 0
  end

  def play
    until @board.full? || @board.winner?
      @board.display

      current_player = @players[@current_player_index]
      move = current_player.get_move(@board)
      @board.make_move(move, current_player.mark)

      @current_player_index = (@current_player_index + 1) % 2
    end

    @board.display
    if @board.winner?
      puts "Player #{@players[(@current_player_index - 1) % 2].mark} wins!"
    else
      puts "It's a draw!"
    end
  end
end
