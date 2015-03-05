require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../../lib/toy_robot_simulator/commands/right'

describe ToyRobotSimulator::Commands::Right do
  before do
    @toy_robot = MiniTest::Mock.new
  end

  it "should initialize with a toy robot" do
    command = ToyRobotSimulator::Commands::Right.new(@toy_robot)

    command.wont_be_nil
  end

  it "should order toy robot to rotate right when command is issued" do
    @toy_robot.expect(:rotate_right, nil)

    command = ToyRobotSimulator::Commands::Right.new(@toy_robot)
    command.execute

    assert @toy_robot.verify
  end
end
