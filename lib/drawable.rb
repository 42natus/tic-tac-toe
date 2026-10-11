# frozen_string_literal: true

# This module is responsible for drawing 3x3 grids in the terminal.
module Drawable
  def format(row)
    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end

  def arrange(space, line, rows)
    puts '', space, rows[0], space, line
    puts space, rows[1], space, line
    puts space, rows[2], space, ''
  end

  def draw(grid)
    space = '     |     |     '
    line = '— — — — — — — — —'
    rows = grid.map { |row| format(row) }

    arrange(space, line, rows)
  end
end
