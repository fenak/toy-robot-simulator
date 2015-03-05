require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/toy_robot_simulator/exceptions'
require_relative '../lib/toy_robot_simulator/orientation'
require_relative '../lib/toy_robot_simulator/position'

describe ToyRobotSimulator::Orientation do

  describe "North" do
    before do
      @orientation = ToyRobotSimulator::Orientation.new(:north)
    end

    it "should initialize with North" do
      @orientation.name.must_equal "North"
    end

    it "should have West on its left" do
      @orientation.turn_left.name.must_equal "West"
    end

    it "should have East on its right" do
      @orientation.turn_right.name.must_equal "East"
    end

    it "should calculate position for a step towards orientation" do
      initial_position = ToyRobotSimulator::Position.new(1, 2)

      new_position = @orientation.step(initial_position)
      new_position.x.must_equal 1
      new_position.y.must_equal 3
    end
  end

  describe "East" do
    before do
      @orientation = ToyRobotSimulator::Orientation.new(:east)
    end

    it "should initialize with East" do
      @orientation.name.must_equal "East"
    end

    it "should have North on its left" do
      @orientation.turn_left.name.must_equal "North"
    end

    it "should have South on its right" do
      @orientation.turn_right.name.must_equal "South"
    end

    it "should calculate position for a step towards orientation" do
      initial_position = ToyRobotSimulator::Position.new(1, 2)

      new_position = @orientation.step(initial_position)
      new_position.x.must_equal 2
      new_position.y.must_equal 2
    end
  end

  describe "South" do
    before do
      @orientation = ToyRobotSimulator::Orientation.new(:south)
    end

    it "should initialize with South" do
      @orientation.name.must_equal "South"
    end

    it "should have East on its left" do
      @orientation.turn_left.name.must_equal "East"
    end

    it "should have West on its right" do
      @orientation.turn_right.name.must_equal "West"
    end

    it "should calculate position for a step towards orientation" do
      initial_position = ToyRobotSimulator::Position.new(1, 2)

      new_position = @orientation.step(initial_position)
      new_position.x.must_equal 1
      new_position.y.must_equal 1
    end
  end

  describe "West" do
    before do
      @orientation = ToyRobotSimulator::Orientation.new(:west)
    end

    it "should initialize with West" do
      @orientation.name.must_equal "West"
    end

    it "should have South on its left" do
      @orientation.turn_left.name.must_equal "South"
    end

    it "should have North on its right" do
      @orientation.turn_right.name.must_equal "North"
    end

    it "should calculate position for a step towards orientation" do
      initial_position = ToyRobotSimulator::Position.new(1, 2)

      new_position = @orientation.step(initial_position)
      new_position.x.must_equal 0
      new_position.y.must_equal 2
    end
  end

  it "should raise InvalidOrientationError if cardinal orientation does not exist" do
    proc {
      ToyRobotSimulator::Orientation.new(:northeast)
    }.must_raise ToyRobotSimulator::Error::InvalidOrientationError
  end
end
