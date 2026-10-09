class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
    label = 1
    @board.each_index do |row|
      @board[row].each_index do |cell|
        @board[row][cell] = label
        label += 1
      end
    end
  end
end
