class Tile
  attr_accessor :position, :bombed, :flagged, :revealed, :board

  def initialize(position, board)
    @revealed = false
    @bombed = false
    @flagged = false
    @position = position
    @board = board
  end

  # NEIGHBORS = [
  #   [ 1,  0],
  #   [-1,  0],
  #   [ 0,  1],
  #   [ 0, -1],
  #   [-1, -1],
  #   [-1,  1],
  #   [ 1,  1],
  #   [ 1,-1]
  # ]


  def neighbors
    neighbors = [[1,0], [-1,0], [0,1], [0,-1], [-1,-1], [-1,1], [1,1], [1,-1]]
    neighbor_tiles = []

    neighbors.each do |pair|
      potential = [pair[0] + @position[0], pair[1] + @position[1]]
      if potential.min >= 0 && potential.max < 9
        neighbor_tiles << @board.grid[potential[0]][potential[1]]
      end
    end
    neighbor_tiles
  end

  def neighbor_bomb_count
    bomb_value = 0
    neighbors.each do |tile|
      bomb_value += 1 if tile.bombed
    end
    bomb_value
  end

  def render
    if !@revealed
      "*"
    elsif @bombed
      "B"
    elsif @flagged
      "F"
    elsif neighbor_bomb_count > 0
      neighbor_bomb_count.to_s
    else
      "_"
    end
  end

  def reveal
    @revealed = true
    if neighbor_bomb_count == 0
      neighbors.each do |neighbor|
        unless neighbor.revealed
          neighbor.reveal
        end
      end
    end
  end



end
