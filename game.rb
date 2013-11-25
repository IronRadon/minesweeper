class Game
  def initialize
    @board = Board.new
  end

  def play
    #call move method
  end

  def move
    puts "Pick a tile. Format: [x,y]"
    tile = gets.chomp
    puts "Reveal or Flag. R/F ?"
    action = gets.chomp



end