class Player
  def initialize(mark)
    @mark = mark    
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
end
