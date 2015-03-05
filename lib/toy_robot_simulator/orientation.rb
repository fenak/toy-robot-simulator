require_relative 'exceptions'

module ToyRobotSimulator
  class Orientation

    def initialize(cardinal_orientation_name)
      @cardinal_orientation = from_name(cardinal_orientation_name)
    end

    def name
      @cardinal_orientation.name.split("::").last
    end

    def turn_left
      @cardinal_orientation = @cardinal_orientation.left
      self
    end

    def turn_right
      @cardinal_orientation = @cardinal_orientation.right
      self
    end

    def step(initial_position)
      @cardinal_orientation.step(initial_position)
    end

    private
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

    class North 
      def self.left
        West
      end

      def self.right
        East
      end

      def self.step(initial_position)
        ToyRobotSimulator::Position.new(initial_position.x, initial_position.y + 1)
      end
    end

    class East
      def self.left
        North
      end

      def self.right
        South
      end

      def self.step(initial_position)
        ToyRobotSimulator::Position.new(initial_position.x + 1, initial_position.y)
      end
    end

    class South
      def self.left
        East
      end

      def self.right
        West
      end

      def self.step(initial_position)
        ToyRobotSimulator::Position.new(initial_position.x, initial_position.y - 1)
      end
    end

    class West
      def self.left
        South
      end

      def self.right
        North
      end

      def self.step(initial_position)
        ToyRobotSimulator::Position.new(initial_position.x - 1, initial_position.y)
      end
    end
  end
end
