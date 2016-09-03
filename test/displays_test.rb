gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/displays'
require "minitest/pride"

class DisplaysTest < Minitest::Test

  def test_session_input_is_positive_value
    skip
    #dont know how to do this - raise error
  end

  def test_session_input_is_divisible_by_60
    skip
    #dont know how to do this - raise error
  end

  def test_variation_in_bounds_reading_separate_data
    sb_size = Displays.new("sb").bound.size
    nb_size = Displays.new("nb").bound.size
    assert_equal false , sb_size == nb_size
  end

  def test_init_no_arguments_default_60mins
    assert_equal 60, Displays.new.minutes
  end

  def test_init_with_arguments_30mins
    assert_equal 30, Displays.new("nb",30).minutes
  end

  def test_sections_init_is_correct
    assert_equal 2, Displays.new("nb",30).sections
  end

  def test_sort_sectins_hash_init
    result_hash = Displays.new("nb",30).sort_sections
    assert_instance_of Hash, result_hash
  end

  def test_sort_sectins_hash_successful_population
    result_hash = Displays.new("nb",30).sort_sections
    assert_equal true, result_hash.size != 0
  end

end
