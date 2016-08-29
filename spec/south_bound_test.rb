require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/south_bound'
require "minitest/pride"

class SorthBoundTest < Minitest::Test

  def test_sb_vehicle_array_initialization
    sorth_vehicles = SorthBound.new.isolate_SB_vehicles_B
  assert_equal true, sorth_vehicles.respond_to?(:to_a)
  end

  def test_successful_sb_vehicles_population
    sorth_vehicles = SorthBound.new.isolate_SB_vehicles_B
  assert_equal true, sorth_vehicles.size != 0
  end

end
