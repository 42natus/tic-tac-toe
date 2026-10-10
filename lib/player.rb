class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def play(grid)
    print "Player #{mark} marks "

    cell = gets.chomp.to_i

    while grid.marked?(cell) || !(1..9).include?(cell)
      puts "Invalid spot. Try again!"

      cell = gets.chomp.to_i
    end

    grid.update(cell, mark)
  end

  def has_won
    "Player #{mark} has won!"
  end
end
