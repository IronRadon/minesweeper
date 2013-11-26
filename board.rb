require './tile.rb'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { Array.new(9) }
    generate_tiles
  end

  def generate_tiles
    @board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        @board[row_idx][col_idx] = Tile.new([row_idx, col_idx],@board)
      end
    end
    @board
  end

  def display
    current_board = ""
    @board.map do |row|
      row.map do |tile|
        current_board << tile.render
      end
      current_board << "\n"
    end
    puts current_board
  end

end

new_board = Board.new
new_board.board[0][5].bombed = true
new_board.board[1][2].bombed = true
new_board.display

new_board.board[4][4].reveal
new_board.display
p new_board.board[1][1].bomb_value

# p new.board[0][0].neighbor_bomb_count
