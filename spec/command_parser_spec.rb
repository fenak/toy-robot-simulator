require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/toy_robot_simulator/command_parser'
require_relative '../lib/toy_robot_simulator/table_top'
require_relative '../lib/toy_robot_simulator/toy_robot'

describe ToyRobotSimulator::CommandParser do
  before do
    table_top = ToyRobotSimulator::TableTop.new(5)
    toy_robot = ToyRobotSimulator::ToyRobot.new(table_top)
    @command_parser = ToyRobotSimulator::CommandParser.new(toy_robot)
  end

  describe "#parse" do
    it "should return a Move command for MOVE" do
      command = @command_parser.parse("MOVE")

      command.must_be_instance_of ToyRobotSimulator::Commands::Move
    end

    it "should return a Left command for LEFT" do
      command = @command_parser.parse("LEFT")

      command.must_be_instance_of ToyRobotSimulator::Commands::Left
    end

    it "should return a Right command for RIGHT" do
      command = @command_parser.parse("RIGHT")

      command.must_be_instance_of ToyRobotSimulator::Commands::Right
    end

    it "should return a Report command for REPORT" do
      command = @command_parser.parse("REPORT")

      command.must_be_instance_of ToyRobotSimulator::Commands::Report
    end

    it "should return a Place command for PLACE" do
      command = @command_parser.parse("PLACE 1,3,EAST")

      command.must_be_instance_of ToyRobotSimulator::Commands::Place
    end
  end
end
