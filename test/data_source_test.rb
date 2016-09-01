require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_source'
require "minitest/pride"

class DataSourceTest < Minitest::Test

  def test_that_dataset_exist
    data = Source.new.locate_data
    assert_equal true, data.size > 0
  end

end
