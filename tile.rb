class Tile
  attr_accessor :position, :bombed, :flagged, :revealed, :board, :bomb_value

  def initialize(position, board)
    @revealed = false
    @bombed = false
    @flagged = false
    @position = position
    @board = board
    @bomb_value = 0
  end


  def neighbors
    neighbors = [[1,0], [-1,0], [0,1], [0,-1], [-1,-1], [-1,1], [1,1], [1,-1]]
    neighbor_tiles = Array.new

    neighbors.each do |pair|
      potential = [pair[0] + @position[0], pair[1] + @position[1]]
      if potential.min >= 0 && potential.max < 9
        neighbor_tiles << @board[potential[0]][potential[1]]
      end
    end
  neighbor_tiles
  end

  def neighbor_bomb_count
    neighbors.each do |tile|
      @bomb_value += 1 if tile.bombed
    end
    @bomb_value
  end

  def reveal
    unless @revealed
      "*"
    else
      if @bombed
        "B"
      elsif @flagged
        "F"
      elsif @bomb_value > 0
        @bombvalue.to_s
      end
    end
  end



end
