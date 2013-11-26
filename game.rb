
class Game
  def initialize
    @board = Board.new
  end

  def play
    #call move method
  end

  def move

    puts "Pick a tile. Format: [x, y]"
    pos = gets.chomp

    puts "Reveal or Flag. R/F ?"
    action = gets.chomp

    current_tile = @board[pos[1]][pos[0]] #tile object


    if action.upcase == "F"
      #current_tile.revealed = true
      current_tile.flagged = true
    elsif action.upcase == "R"
      current_tile.bombed
    end
  end


end
