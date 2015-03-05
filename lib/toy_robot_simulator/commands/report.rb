module ToyRobotSimulator
  module Commands
    class Report

      def initialize(toy_robot, output=$stdout)
        @toy_robot = toy_robot
        @output = output
      end

      def execute
        report = @toy_robot.report

        @output.puts(report) unless report.nil?
      end
    end
  end
end
