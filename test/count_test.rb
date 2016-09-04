gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/count'
require "minitest/pride"

class CountTest < Minitest::Test

  def test_class_init_succesful
    assert_equal true, Count.new("nb") != nil
  end

  def test_weekly_peaks_successfully_populated
    assert_equal true, Count.new.determine_peaks.size != 0
  end

  def test_compare_method_successfully_populated
    assert_equal true, Count.new.compare_morning_evening.size != 0
  end

end
