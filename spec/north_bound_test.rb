require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/north_bound'
require "minitest/pride"

class NorthBoundTest < Minitest::Test

  def test_nb_vehicle_array_initialization
    north_vehicles = NorthBound.new.isolate_NB_vehicles_A
  assert_equal true, north_vehicles.respond_to?(:to_a)
  end
  
  def test_successful_nb_vehicles_population
    north_vehicles = NorthBound.new.isolate_NB_vehicles_A
  assert_equal true, north_vehicles.size > 0
  end

end
