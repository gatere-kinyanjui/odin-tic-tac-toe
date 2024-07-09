class Board # rubocop:disable Style/Documentation
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonals
  ].freeze

  def initialize
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts ' -------- '
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts ' -------- '
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def valid_move?(move)
    move.between?(0, 8) && @cells[move] == ' '
  end

  def make_move(move, mark)
    @cells[move] = mark
  end

  def full?
    @cells.all? { |cell| cell != ' ' }
  end

  def winner?
    WINNING_COMBINATIONS.any? do |combo|
      @cells[combo[0]] != ' ' &&
        @cells[combo[0]] == @cells[combo[1]] &&
        @cells[combo[1]] == @cells[combo[2]]
    end
  end
end
