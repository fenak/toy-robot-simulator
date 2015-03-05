module ToyRobotSimulator
  module Commands
    class Right

      def initialize(toy_robot)
        @toy_robot = toy_robot
      end

      def execute
        @toy_robot.rotate_right
      end
    end
  end
end
