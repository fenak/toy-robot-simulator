require_relative 'exceptions'
require_relative 'orientation/cardinal_directions'

module ToyRobotSimulator
  class Orientation

    def initialize(cardinal_orientation_name)
      @cardinal_orientation = from_name(cardinal_orientation_name)
    end

    def name
      @cardinal_orientation.name.split("::").last
    end

    def rotate_left
      @cardinal_orientation = @cardinal_orientation.left
      self
    end

    def rotate_right
      @cardinal_orientation = @cardinal_orientation.right
      self
    end

    def step(initial_position)
      @cardinal_orientation.step(initial_position)
    end

    private
    include CardinalDirections

    def from_name(cardinal_orientation_name)
      case cardinal_orientation_name.to_sym
      when :north
        North
      when :east
        East
      when :south
        South
      when :west
        West
      else
        raise ToyRobotSimulator::Error::InvalidOrientationError
      end
    end

  end
end
