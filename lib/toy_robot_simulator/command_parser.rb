require_relative 'commands/move'
require_relative 'commands/left'
require_relative 'commands/right'
require_relative 'commands/report'
require_relative 'commands/place'
require_relative 'commands/unknown'

module ToyRobotSimulator
  class CommandParser

    def initialize(toy_robot)
      @toy_robot = toy_robot
    end

    def parse(command_str)
      action, params = command_str.split

      case action
      when "MOVE"
        ToyRobotSimulator::Commands::Move.new(@toy_robot)
      when "LEFT"
        ToyRobotSimulator::Commands::Left.new(@toy_robot)
      when "RIGHT"
        ToyRobotSimulator::Commands::Right.new(@toy_robot)
      when "REPORT"
        ToyRobotSimulator::Commands::Report.new(@toy_robot)
      when "PLACE"
        ToyRobotSimulator::Commands::Place.new(@toy_robot, params)
      else
        ToyRobotSimulator::Commands::Unknown.new
      end
    end
  end
end
