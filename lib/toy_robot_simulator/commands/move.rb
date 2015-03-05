module ToyRobotSimulator
  module Commands
    class Move

      def initialize(toy_robot)
        @toy_robot = toy_robot
      end

      def execute
        @toy_robot.move
      end
    end
  end
end
