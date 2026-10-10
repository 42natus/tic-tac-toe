module Winnable
  def horizontal_win(grid)
    grid.each do |row|
      return [true, 'X'] if row.all?('X')
      return [true, 'O'] if row.all?('O')
    end
  end

  def vertical_win(grid)
    horizontal_win(grid.transpose)
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

  def diagonal_win(grid)
    tb_diagonal = top_bottom_diagonal(grid)

    bt_diagonal = bottom_top_diagonal(grid)

    return [true, 'X'] if tb_diagonal.all?('X')
    return [true, 'O'] if tb_diagonal.all?('O')
    return [true, 'X'] if bt_diagonal.all?('X')
    return [true, 'O'] if bt_diagonal.all?('O')
  end
end
