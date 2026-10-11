# frozen_string_literal: true

# This module defines the methods for checking win conditions and determining
# the game winner. It's used by the Grid to "observe" its state.
module Strikable
  def horizontal_strike?(grid)
    grid.each do |row|
      return true if row.all?('X') || row.all?('O')
    end

    false
  end

  def vertical_strike?(grid)
    horizontal_strike?(grid.transpose)
  end

  def top_bottom_diagonal(grid)
    diagonal = []

    3.times { |i| diagonal << grid[i][i] }

    diagonal
  end

  def bottom_top_diagonal(grid)
    diagonal = []
    diagonal << grid[2][0]
    diagonal << grid[1][1]
    diagonal << grid[0][2]
  end

  def diagonal_strike?(grid)
    tb_diagonal = top_bottom_diagonal(grid)

    bt_diagonal = bottom_top_diagonal(grid)

    tb_diagonal.all?('X') || tb_diagonal.all?('O') ||
      bt_diagonal.all?('X') || bt_diagonal.all?('O')
  end

  def horizontal_strike(grid)
    grid.each do |row|
      return 'X' if row.all?('X')
      return 'O' if row.all?('O')
    end
  end

  def vertical_strike(grid)
    horizontal_strike(grid.transpose)
  end

  def diagonal_strike(grid)
    tb_diagonal = top_bottom_diagonal(grid)

    bt_diagonal = bottom_top_diagonal(grid)

    return 'X' if tb_diagonal.all?('X') || bt_diagonal.all?('X')

    'O' if tb_diagonal.all?('O') || bt_diagonal.all?('O')
  end
end
