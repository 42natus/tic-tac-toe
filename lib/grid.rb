# frozen_string_literal: true

require_relative 'drawable'
require_relative 'strikable'

# This defines the 3x3 grid the game will be played on, as well as its
# behaviour/responsibilities.
class Grid
  include Strikable
  include Drawable

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
    draw(@grid)
  end

  def update(cell, mark)
    row, col = coordinates(cell)
    @grid[row][col] = mark
    @marked << cell
  end

  def marked?(cell)
    @marked.include?(cell)
  end

  def coordinates(cell)
    @grid.each_index do |row|
      next if @grid[row].index(cell).nil?

      return [row, @grid[row].index(cell)]
    end
  end

  def draw?
    @marked.length == 9 && !strikable?
  end

  def strikable?
    horizontal_strike?(@grid) || vertical_strike?(@grid) ||
      diagonal_strike?(@grid)
  end

  def gameover?
    strikable? || draw?
  end

  def announce_winner(player_x, player_o)
    if horizontal_strike(@grid) == 'X' || vertical_strike(@grid) == 'X' ||
       diagonal_strike(@grid) == 'X'
      puts player_x.won
    else
      puts player_o.won
    end
  end
end
