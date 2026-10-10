class Player
  attr_reader :won

  def initialize(mark)
    @mark = mark
    @won = false
  end

  def play(grid)
    puts "Player #{@mark}:"

    cell = gets.chomp.to_i

    while grid.marked?(cell) || !(1..9).include?(cell)
      puts "Invalid spot. Try again!"

      cell = gets.chomp.to_i
    end

    grid.update(cell, @mark)
  end

  def has_won
    puts "Player #{@mark} has won!"
    @won = true
  end
end
