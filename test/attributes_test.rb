gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/attributes'
require "minitest/pride"

class AttributesTest < Minitest::Test

  def test_successful_class_init
    assert_equal true, Attributes.new != nil
  end

  def test_weekly_speed_results_successful_population
    assert_equal true, Attributes.new.speed.size > 0
  end

  def test_distance_results_successful_population
    assert_equal 5, Attributes.new.distance_apart(0,0).size
  end

end
