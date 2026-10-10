require_relative 'lib/grid'
require_relative 'lib/player'
require_relative 'lib/winnable'

grid = Grid.new
player_x = Player.new('X')
player_o = Player.new('O')

grid.display

until grid.gameover? || grid.draw?
  player_x.play(grid)
  
  grid.display

  if grid.gameover? || grid.draw?
    break
  end
  
  player_o.play(grid)

  grid.display
end

puts 'Game over!'
