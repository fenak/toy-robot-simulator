require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../../lib/toy_robot_simulator/commands/report'

describe ToyRobotSimulator::Commands::Report do
  before do
    @toy_robot = MiniTest::Mock.new
    @stdout = MiniTest::Mock.new
  end

  it "should initialize with a toy robot and an output" do
    command = ToyRobotSimulator::Commands::Report.new(@toy_robot, @stdout)

    command.wont_be_nil
  end

  it "should order toy robot to report position and orientation when command is issued" do
    @toy_robot.expect(:report, "0,1,SOUTH")
    @stdout.expect(:puts, nil, ["0,1,SOUTH"])

    command = ToyRobotSimulator::Commands::Report.new(@toy_robot, @stdout)
    command.execute

    assert @toy_robot.verify
  end

  it "should print report if available" do
    @toy_robot.expect(:report, "0,1,SOUTH")
    @stdout.expect(:puts, nil, ["0,1,SOUTH"])

    command = ToyRobotSimulator::Commands::Report.new(@toy_robot, @stdout)
    command.execute

    assert @stdout.verify
  end

  it "should not print anything if report is not available" do
    @toy_robot.expect(:report, nil)
    @stdout.expect(:puts, nil, [nil])

    command = ToyRobotSimulator::Commands::Report.new(@toy_robot, @stdout)
    command.execute

    proc {
      assert @stdout.verify
    }.must_raise MockExpectationError, "puts should not be called"
  end
end
