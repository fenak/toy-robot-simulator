require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/toy_robot_simulator/position'

describe ToyRobotSimulator::Position do
  it "should be initialized with x and y coordinates" do
    position = ToyRobotSimulator::Position.new(0, 0)

    position.x.must_equal 0
    position.y.must_equal 0
  end
end
