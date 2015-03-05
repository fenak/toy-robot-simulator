module ToyRobotSimulator
  module Commands
    class Place

      PARAMS_DELIMITER = ','

      def initialize(toy_robot, params)
        @toy_robot = toy_robot
        parse_params(params)
      end

      def execute
        @toy_robot.place(@x, @y, @orientation.downcase.to_sym)
      end

      private
      def parse_params(params)
        x, y, orientation = params.split(PARAMS_DELIMITER)
        @x = x.to_i
        @y = y.to_i
        @orientation = orientation
      end
    end
  end
end
