module ToyRobotSimulator
  module Commands
    class Left

      def initialize(toy_robot)
        @toy_robot = toy_robot
      end

      def execute
        @toy_robot.rotate_left
      end
    end
  end
end
