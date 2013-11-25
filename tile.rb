class Tile
  attr_accessor :position, :bombed, :flagged, :revealed, :value

  def initialize(position)
    @revealed = false
    @bombed = false
    @flagged = false
    @position = position
    @value = nil
  end

  def neighbors
    neighbors = [[1,0], [-1,0], [0,1], [0,-1], [-1,-1], [-1,1], [1,1],
                [1,-1]]
    neighbor_positions = Array.new

    neighbors.each do |pair|
      potential = [pair[0]+@position[0], pair[1]+@position[1]]
      if potential.min >= 0 && potential.max < 9
        neighbor_positions << potential
      end
    end
  neighbor_positions
  end

  def neighbor_bomb_count

  end
end