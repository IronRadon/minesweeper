require './tile.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    generate_tiles
  end

  def generate_tiles
    @grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        @grid[row_idx][col_idx] = Tile.new([row_idx, col_idx], self)
      end
    end
    @grid
  end

  def display
    current_board = ""
    @grid.map do |row|
      row.map do |tile|
        current_board << tile.render
      end
      current_board << "\n"
    end
    puts current_board
  end

end

# new_board = Board.new
# new_board.board[0][5].bombed = true
# new_board.board[1][2].bombed = true
# new_board.display
#
# new_board.board[4][4].reveal
# new_board.display
# p new_board.board[1][1].bomb_value

# p new.board[0][0].neighbor_bomb_count
