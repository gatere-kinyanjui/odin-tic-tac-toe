class Player # rubocop:disable Style/Documentation
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_move(board)
    loop do
      puts "Player #{mark}'s turn to make a move (1-9)"
      move = gets.chomp.to_i - 1
      return move if board.valid_move?(move)

      puts 'Invalid move. Try again.'
    end
  end
end
