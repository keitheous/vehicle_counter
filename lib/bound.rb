require 'pry'
require_relative 'data_source'

class Bound
  attr_reader :all_vehicle_data
  def initialize
    @all_vehicle_data = DataSource.new.locate
  end

  def north
    nb_vehicles = []

    all_vehicle_data.each_with_index do |_, index|
      if index % 2 == 0 #process two lines at a time starting from 0-1, 2-3, etc
        nb_vehicles << all_vehicle_data[index] << all_vehicle_data[index+1] if all_vehicle_data[index][0] == all_vehicle_data[index + 1][0]
          # filtering for AA patterns, store first Axle & second Axle in sequential order
      end
    end
    nb_vehicles
  end

  def south
    sb_vehicles = []
    all_vehicle_data.each { |line| sb_vehicles << line if line[0] == "B" }
        # filtering all Bs & store in sb vehicles array
    sb_vehicles
  end

end

# a = Bound.new
# binding.pry
