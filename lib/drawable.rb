# frozen_string_literal: true

# This module is responsible for drawing 3x3 grids in the terminal. It's used
# by a `Grid` object to display its state after each turn.
module Drawable
  def format(row)
    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end

  def clean(row)
    row.each_index do |i|
      row[i] = ' ' if row[i].instance_of?(Integer)
    end

    "  #{row[0]}  |  #{row[1]}  |  #{row[2]}  "
  end

  def arrange(space, line, rows)
    puts '', space, rows[0], space, line
    puts space, rows[1], space, line
    puts space, rows[2], space, ''
  end

  def draw(grid, clean: false)
    space = '     |     |     '
    line = '— — — — — — — — —'
    rows = if clean
             grid.map { |row| clean(row) }
           else
             grid.map { |row| format(row) }
           end

    arrange(space, line, rows)
  end
end
