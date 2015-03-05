require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/toy_robot_simulator/table_top'
require_relative '../lib/toy_robot_simulator/position'

describe ToyRobotSimulator::TableTop do
  it "should be initialized with a size" do
    table_top = ToyRobotSimulator::TableTop.new(3)

    table_top.width.must_equal 3
    table_top.height.must_equal 3
  end

  describe "#valid_position?" do
    it "should validate if a position is valid inside the table top area" do
      table_top = ToyRobotSimulator::TableTop.new(5)

      good_position = ToyRobotSimulator::Position.new(0, 4)
      bad_width_position = ToyRobotSimulator::Position.new(5, 3)
      bad_height_position = ToyRobotSimulator::Position.new(2, 5)
      terrible_position = ToyRobotSimulator::Position.new(-2, 10)

      table_top.valid_position?(good_position).must_equal true
      table_top.valid_position?(bad_width_position).must_equal false
      table_top.valid_position?(bad_height_position).must_equal false
      table_top.valid_position?(terrible_position).must_equal false
    end
  end
end
