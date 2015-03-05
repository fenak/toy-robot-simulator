require_relative 'direction'
require_relative 'position'

module ToyRobotSimulator
  class ToyRobot

    def initialize(table_top)
      @table_top = table_top
    end

    def place(x, y, direction)
      new_position = ToyRobotSimulator::Position.new(x, y)
      new_direction = ToyRobotSimulator::Direction.new(direction)

      if (@table_top.valid_position?(new_position))
        @position = new_position
        @direction = new_direction
      end
    end

    def move
      if (placed?)
        new_position = @direction.step(@position)

        if (@table_top.valid_position?(new_position))
          @position = new_position
        end
      end
    end

    def rotate_left
      if (placed?)
        @direction.turn_left and return
      end
    end

    def rotate_right
      if (placed?)
        @direction.turn_right and return
      end
    end

    def report
      if (placed?)
        [current_position.x, current_position.y, current_direction.upcase].join(',')
      end
    end

    def current_position
      @position
    end

    def current_direction
      @direction.name if @direction
    end

    private
    def placed?
      @position && @direction
    end
  end
end
