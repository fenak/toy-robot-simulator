require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../../lib/toy_robot_simulator/commands/place'

describe ToyRobotSimulator::Commands::Place do
  before do
    @toy_robot = MiniTest::Mock.new
  end

  it "should initialize with a toy robot and the command params" do
    params = '0,1,NORTH'
    command = ToyRobotSimulator::Commands::Place.new(@toy_robot, params)

    command.wont_be_nil
  end

  it "should place toy robot when command is issued" do
    params = '0,1,NORTH'
    @toy_robot.expect(:place, nil, [0, 1, :north])

    command = ToyRobotSimulator::Commands::Place.new(@toy_robot, params)
    command.execute

    assert @toy_robot.verify
  end
end
