module ToyRobotSimulator
  class TableTop

    attr_reader :width, :height

    def initialize(size)
      @width = @height = size
    end

    def valid_position?(position)
      position.x >= 0 && position.x < width &&
      position.y >= 0 && position.y < height
    end
  end
end
