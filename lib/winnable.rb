module Winnable
  def horizontal_win(grid)
    grid.each do |row|
      return true if row.all?('X') || row.all?('O')
    end
    
    false
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

    return true if tb_diagonal.all?('X') || tb_diagonal.all?('O') || 
                   bt_diagonal.all?('X') || bt_diagonal.all?('O')

    false
  end

  def horizontal_winner(grid)
    grid.each do |row|
      return 'X' if row.all?('X')
      return 'O' if row.all?('O')
    end
  end

  def vertical_winner(grid)
    horizontal_winner(grid.transpose)
  end

  def diagonal_winner(grid)
    tb_diagonal = top_bottom_diagonal(grid)

    bt_diagonal = bottom_top_diagonal(grid)

    return 'X' if tb_diagonal.all?('X') || bt_diagonal.all?('X')
    return 'O' if tb_diagonal.all?('O') || bt_diagonal.all?('O')
  end
end
