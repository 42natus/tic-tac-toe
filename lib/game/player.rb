# frozen_string_literal: true

# This is the blueprint for both of the game players.
class Player
  attr_accessor :name, :points

  def initialize(mark)
    @mark = mark
    @points = 0
  end

  def play(grid)
    print "#{name} marks "

    cell = gets.to_i

    while grid.marked?(cell) || !(1..9).include?(cell)
      puts 'Invalid spot. Try again!'

      cell = gets.to_i
    end

    grid.update(cell, @mark)
  end

  def won
    self.points += 1
    "#{name} won!"
  end
end
