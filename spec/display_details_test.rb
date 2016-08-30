require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/display_details'
require "minitest/pride"

class DisplayDetailsTest < Minitest::Test

  #how to test for raise error if value is -ve or not divisable by 60

  #how to check for arguments

  def test_variation_in_both_bounds
    sb_size = Display.new("sb").bound_subject.size
    nb_size = Display.new("nb").bound_subject.size
  assert_equal false , sb_size == nb_size
  end

  def test_returned_result_type_instance
    result = Display.new.by_time_section
  assert_kind_of Object , result.kind_of?
  end

  def test_returned_result_successfully_populated
    result = Display.new.by_time_section
  assert_equal true , result.size > 0
  end


end
