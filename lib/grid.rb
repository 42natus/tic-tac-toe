class Grid
  def initialize
    @grid = Array.new(3) { Array.new(3) }
    label = 1
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        @grid[row][col] = label
        label += 1
      end
    end

    @marked = []
  end

  def display
    puts '     |     |     '
    puts "  #{@grid[0][0]}  |  #{@grid[0][1]}  |  #{@grid[0][2]}  "
    puts '     |     |     '
    puts '— — — — — — — — —'
    puts '     |     |     '
    puts "  #{@grid[1][0]}  |  #{@grid[1][1]}  |  #{@grid[1][2]}  "
    puts '     |     |     '
    puts '— — — — — — — — —'
    puts '     |     |     '
    puts "  #{@grid[2][0]}  |  #{@grid[2][1]}  |  #{@grid[2][2]}  "
    puts '     |     |     '
  end

  def marked?(cell)
    @marked.include?(cell)
  end

  def update(cell, mark)
    row, col = coordinates(cell)
    @grid[row][col] = mark
    @marked << cell
  end

  def coordinates(cell)
    @grid.each_index do |row|
      next if @grid[row].index(cell).nil?
      return [row, @grid[row].index(cell)]
    end
  end
end
