require_relative 'direction'
require_relative 'position'

module ToyRobotSimulator
  class ToyRobot

    def initialize(table_top)
      @table_top = table_top
    end

    def place(x, y, orientation)
      new_position = ToyRobotSimulator::Position.new(x, y)
      new_orientation = ToyRobotSimulator::Direction.new(orientation)

      if (@table_top.valid_position?(new_position))
        @position = new_position
        @orientation = new_orientation
      end
    end

    def move
      if (placed?)
        new_position = @orientation.step(@position)

        if (@table_top.valid_position?(new_position))
          @position = new_position
        end
      end
    end

    def rotate_left
      if (placed?)
        @orientation.turn_left and return
      end
    end

    def rotate_right
      if (placed?)
        @orientation.turn_right and return
      end
    end

    def report
      if (placed?)
        [current_position.x, current_position.y, current_orientation.upcase].join(',')
      end
    end

    def current_position
      @position
    end

    def current_orientation
      @orientation.name if @orientation
    end

    private
    def placed?
      @position && @orientation
    end
  end
end
