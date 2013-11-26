require './board.rb'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play

  end

  def move

    puts "Pick a tile. Format: [x, y]"
    pos = gets.chomp

    puts "Reveal or Flag. R/F ?"
    action = gets.chomp

    current_tile = @board[pos[1]][pos[0]] #tile object


    if action.upcase == "F"
      current_tile.revealed = true
      current_tile.flagged = true
    elsif action.upcase == "R"
      current_tile.reveal
    end

  end

  def won?
    @board.grid.each do |row|
      row.each do |tile|
        if tile.render != "*"
          if tile.bombed && tile.flagged
            return true
          end
        end
      end
    end
    false
  end

  def lost?(tile)
    tile.revealed && tile.bombed
  end

  def game_over?

  end
end

new_game = Game.new
new_game.board.grid[0][5].bombed = true
new_game.board.display

new_game.board.grid[4][4].reveal
new_game.board.grid[0][5].flagged = true
new_game.board.grid[0][5].revealed = true
new_game.board.display
p new_game.won?

