class Player
  def initialize(mark)
    @mark = mark    
  end

  def play(board)
    puts "Player #{@mark}:"
    
    cell = gets.chomp.to_i
    
    while board.filled?(cell)
      puts "That spot's marked. Try again."
      
      cell = gets.chomp.to_i
    end

    board.update(cell, @mark)
  end
end
