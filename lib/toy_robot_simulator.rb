require_relative 'toy_robot_simulator/table_top'
require_relative 'toy_robot_simulator/toy_robot'
require_relative 'toy_robot_simulator/command_parser'

module ToyRobotSimulator
  class Main

    def initialize
      table_top = ToyRobotSimulator::TableTop.new(5)
      @toy_robot = ToyRobotSimulator::ToyRobot.new(table_top)
    end

    def run
      process('input.txt')
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

ToyRobotSimulator::Main.new.run
