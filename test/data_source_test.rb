gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_source'
require "minitest/pride"

class DataSourceTest < Minitest::Test

  def test_dataset_exist?
    dataset = DataSource.new.locate
    assert_equal true, dataset.size > 0
  end

end
