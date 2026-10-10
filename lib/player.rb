class Player
  attr_reader :won

  def initialize(mark)
    @mark = mark
    @won = false
  end

  def play(grid)
    puts "Player #{@mark}:"
    
    cell = gets.chomp.to_i
    
    while grid.marked?(cell)
      puts "That spot's marked. Try again."
      
      cell = gets.chomp.to_i
    end

    grid.update(cell, @mark)
  end

  def has_won
    puts "Player #{@mark} has won!"
    @won = true
  end
end
