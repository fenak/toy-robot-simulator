require_relative 'exceptions'

module ToyRobotSimulator
  class Direction

    def initialize(cardinal_direction_name)
      @cardinal_direction = from_name(cardinal_direction_name)
    end

    def name
      @cardinal_direction.name.split("::").last
    end

    def turn_left
      @cardinal_direction = @cardinal_direction.left
      self
    end

    def turn_right
      @cardinal_direction = @cardinal_direction.right
      self
    end

    def step(initial_position)
      @cardinal_direction.step(initial_position)
    end

    private
    def from_name(cardinal_direction_name)
      case cardinal_direction_name.to_sym
      when :north
        North
      when :east
        East
      when :south
        South
      when :west
        West
      else
        raise ToyRobotSimulator::Error::InvalidDirectionError
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
