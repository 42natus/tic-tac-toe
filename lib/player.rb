# frozen_string_literal: true

# This is the blueprint for both of the game players.
class Player
  def initialize(mark)
    @mark = mark
  end

  def play(grid)
    print "Player #{@mark} marks "

    cell = gets.chomp.to_i

    while grid.marked?(cell) || !(1..9).include?(cell)
      puts 'Invalid spot. Try again!'

      cell = gets.chomp.to_i
    end

    grid.update(cell, @mark)
  end

  def won
    "Player #{@mark} has won!"
  end
end
