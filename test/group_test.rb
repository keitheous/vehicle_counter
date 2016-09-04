gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/group'
require "minitest/pride"

class GroupTest < Minitest::Test

  attr_reader :sort_object

  def setup
    @sort_object = Group.new("sb")
  end

  def test_population_of_class_init
    assert_equal true, sort_object.bound_arr.size != 0
  end

  def test_instance_of_results_of_method
    assert_instance_of Hash, sort_object.into_pairs_by_day
  end

  def test_successful_population_of_five_days
    assert_equal = 5, sort_object.into_pairs_by_day
  end

end
