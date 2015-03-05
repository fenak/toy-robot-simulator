require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'

require_relative '../../lib/toy_robot_simulator/commands/unknown'

describe ToyRobotSimulator::Commands::Unknown do
  it "should initialize without parameters" do
    command = ToyRobotSimulator::Commands::Unknown.new

    command.wont_be_nil
  end
end
