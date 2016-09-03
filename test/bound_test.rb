gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/bound'
require "minitest/pride"

class BoundTest < Minitest::Test

  attr_reader :nb_vehicles, :sb_vehicles
  def setup
    @nb_vehicles = Bound.new.north
    @sb_vehicles = Bound.new.north
  end

  def test_initialization_of_dataset
    assert_equal true, Bound.new != nil
  end

  def test_nb_vehicle_array_initialization
    assert_equal true, nb_vehicles.respond_to?(:to_a)
  end

  def test_nb_vehicle_array_that_populated
    assert_equal true, nb_vehicles.size != 0
  end

  def test_nb_vehicle_has_AA_patterns
    aa_patterns = nil
    nb_vehicles.each { |line| aa_patterns = line[0] == "A"}
    assert_equal true, aa_patterns
  end

  def test_sb_vehicle_array_initialization
    assert_equal true, sb_vehicles.respond_to?(:to_a)
  end

  def test_sb_vehicle_array_that_populated
    assert_equal true, sb_vehicles.size != 0
  end

  def test_sb_vehicle_has_AA_patterns
    aa_patterns = nil
    sb_vehicles.each { |line| aa_patterns = line[0] == "A"}
    assert_equal true, aa_patterns
  end

end
