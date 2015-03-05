require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/toy_robot_simulator/toy_robot'
require_relative '../lib/toy_robot_simulator/table_top'

describe ToyRobotSimulator::ToyRobot do

  before do
    table_top = ToyRobotSimulator::TableTop.new(5)
    @toy_robot = ToyRobotSimulator::ToyRobot.new(table_top)
  end

  describe "#place" do
    it "should be placed in a valid position on a table top" do
      @toy_robot.place(0, 0, :north)

      @toy_robot.current_position.wont_be_nil
      @toy_robot.current_orientation.must_equal "North"
    end

    it "should not be placed in an invalid position" do
      @toy_robot.place(8, 8, :north)

      @toy_robot.current_position.must_be_nil
      @toy_robot.current_orientation.must_be_nil
    end

    it "should not be placed with an invalid diretion" do
      proc {
        @toy_robot.place(0, 0, :northwest)
      }.must_raise ToyRobotSimulator::Error::InvalidDirectionError
    end
  end

  describe "#move" do
    it "should move one step based on orientation" do
      @toy_robot.place(0, 0, :north)

      @toy_robot.move

      @toy_robot.current_position.x.must_equal 0
      @toy_robot.current_position.y.must_equal 1
      @toy_robot.current_orientation.must_equal "North"
    end

    it "should not move if width boundary reached" do
      @toy_robot.place(4, 4, :east)

      @toy_robot.move

      @toy_robot.current_position.x.must_equal 4
      @toy_robot.current_position.y.must_equal 4
      @toy_robot.current_orientation.must_equal "East"
    end

    it "should not move if height boundary reached" do
      @toy_robot.place(4, 0, :south)

      @toy_robot.move

      @toy_robot.current_position.x.must_equal 4
      @toy_robot.current_position.y.must_equal 0
      @toy_robot.current_orientation.must_equal "South"
    end

    it "should not do anything if toy robot isn't placed anywhere" do
      @toy_robot.move

      @toy_robot.current_position.must_be_nil
      @toy_robot.current_orientation.must_be_nil
    end
  end

  describe "#rotate_left" do
    it "should face West when rotating left from North" do
      @toy_robot.place(2, 2, :north)

      @toy_robot.rotate_left

      @toy_robot.current_position.x.must_equal 2
      @toy_robot.current_position.y.must_equal 2
      @toy_robot.current_orientation.must_equal "West"
    end

    it "should not do anything if toy robot isn't placed anywhere" do
      @toy_robot.rotate_left

      @toy_robot.current_position.must_be_nil
      @toy_robot.current_orientation.must_be_nil
    end
  end

  describe "#rotate_right" do
    it "should face South when rotating right from East" do
      @toy_robot.place(2, 2, :east)

      @toy_robot.rotate_right

      @toy_robot.current_position.x.must_equal 2
      @toy_robot.current_position.y.must_equal 2
      @toy_robot.current_orientation.must_equal "South"
    end

    it "should not do anything if toy robot isn't placed anywhere" do
      @toy_robot.rotate_right

      @toy_robot.current_position.must_be_nil
      @toy_robot.current_orientation.must_be_nil
    end
  end

  describe "#report" do
    it "should report current position and orientation" do
      @toy_robot.place(2, 3, :west)

      @toy_robot.report.must_equal "2,3,WEST"
    end

    it "should not report anything if toy robot isn't placed anywhere" do
      @toy_robot.report.must_be_nil
    end
  end
end
