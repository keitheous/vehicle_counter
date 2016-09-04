gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/session'
require "minitest/pride"

class SessionTest < Minitest::Test

  def test_session_input_is_positive_value
    skip
    #raise error
  end

  def test_session_input_is_divisible_by_60
    skip
    #raise error
  end

  def test_variation_in_bounds_reading_separate_data
    sb_size = Session.new("sb").bound.size
    nb_size = Session.new("nb").bound.size
    assert_equal false , sb_size == nb_size
  end

  def test_init_no_arguments_default_60mins
    assert_equal 60, Session.new.minutes
  end

  def test_init_with_arguments_30mins
    assert_equal 30, Session.new("nb",30).minutes
  end

  def test_sections_init_is_correct
    assert_equal 2, Session.new("nb",30).sections
  end

  def test_sort_sectins_hash_init
    result_hash = Session.new("nb",30).sort_sections
    assert_instance_of Hash, result_hash
  end

  def test_sort_sections_hash_successful_population
    result_hash = Session.new("nb",30).sort_sections
    assert_equal true, result_hash.size != 0
  end

end
