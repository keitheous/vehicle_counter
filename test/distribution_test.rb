gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/distribution'
require "minitest/pride"

class DistributionTest < Minitest::Test
  attr_reader :distribution_object
  def setup
    @distribution_object = Distribution.new
  end
  def test_successful_class_init
    assert_equal true, distribution_object != nil
  end

  def test_weekly_speed_results_successful_population
    assert_equal true, distribution_object.determine_speed.size > 0
  end

  def test_distance_results_successful_population
    assert_equal 5, distribution_object.determine_distance_apart(0,0).size
  end

end
