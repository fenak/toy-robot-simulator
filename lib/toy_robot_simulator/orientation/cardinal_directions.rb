module ToyRobotSimulator
  class Orientation
    module CardinalDirections
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
end
