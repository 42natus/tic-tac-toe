# frozen_string_literal: true

require_relative 'strikable'

# This defines the 3x3 grid the game will be played on, as well as its
# behaviour/responsibilities.
class Grid
  include Strikable

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
    space = '     |     |     '
    line = '— — — — — — — — —'
    row_one = "  #{@grid[0][0]}  |  #{@grid[0][1]}  |  #{@grid[0][2]}  "
    row_two = "  #{@grid[1][0]}  |  #{@grid[1][1]}  |  #{@grid[1][2]}  "
    row_three = "  #{@grid[2][0]}  |  #{@grid[2][1]}  |  #{@grid[2][2]}  "

    puts '', space, row_one, space, line
    puts space, row_two, space, line
    puts space, row_three, space, ''
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

  def draw?
    @marked.length == 9
  end

  def strikable?
    horizontal_strike?(@grid) || vertical_strike?(@grid) ||
      diagonal_strike?(@grid)
  end

  def gameover?
    strikable? || draw?
  end

  def announce_winner(player_x, player_o)
    puts player_x.won if horizontal_strike(@grid) == player_x.mark ||
                         vertical_strike(@grid) == player_x.mark ||
                         diagonal_strike(@grid) == player_x.mark

    puts player_o.won if horizontal_strike(@grid) == player_o.mark ||
                         vertical_strike(@grid) == player_o.mark ||
                         diagonal_strike(@grid) == player_o.mark
  end
end
