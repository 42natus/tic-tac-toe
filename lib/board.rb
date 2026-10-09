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

  def display
    puts '     |     |     '
    puts "  #{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}  "
    puts '     |     |     '
    puts '— — — — — — — — —'
    puts '     |     |     '
    puts "  #{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}  "
    puts '     |     |     '
    puts '— — — — — — — — —'
    puts '     |     |     '
    puts "  #{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}  "
    puts '     |     |     '
  end
end
