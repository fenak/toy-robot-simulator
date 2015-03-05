require_relative 'toy_robot_simulator/table_top'
require_relative 'toy_robot_simulator/toy_robot'
require_relative 'toy_robot_simulator/command_parser'

module ToyRobotSimulator
  class Main

    def initialize(input_file, options={})
      @input_file = input_file
      size = options[:size] || 5
      table_top = ToyRobotSimulator::TableTop.new(size)
      @toy_robot = ToyRobotSimulator::ToyRobot.new(table_top)
    end

    def run
      process(@input_file)
    end

    private
    def process(input_file)
      input_lines = IO.readlines(input_file)
      command_parser = ToyRobotSimulator::CommandParser.new(@toy_robot)

      input_lines.each do |input_line|
        command_parser.parse(input_line).execute
      end
    end
  end
end
