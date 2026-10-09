class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
    label = 1
    @board.each_index do |row|
      @board[row].each_index do |col|
        @board[row][col] = label
        label += 1
      end
    end

    @filled = []
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

  def filled?(cell)
    @filled.include?(cell)
  end

  def update(cell, mark)
    row, col = cell_coordinates(cell)
    @board[row][col] = mark
    @filled << cell
  end

  def cell_coordinates(cell)
    @board.each_index do |row|
      next if @board[row].index(cell).nil?
      return [row, @board[row].index(cell)]
    end
  end
end
