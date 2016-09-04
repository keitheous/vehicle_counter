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

# Thought Process:
# ----------------
# This class sorts lines of data into North and South Bound. For South Bound,
# its all the lines that preceeds with the Letter B. North Bound on the other
# hand is tricky as the As can either belong to North or South Bound.
# The trick was to run through all the lines and locate for instances where "A"
# happens twice in a row. Line 15 traces for with this following syntax.
# all_vehicle_data[index][0] == all_vehicle_data[index + 1][0]
# The current and future's first character must be the same (Letter A). This
# immediately eliminates the ABAB patterns and selects all AA patterns from
# North Bound. This class produces Arrays which then lead into Group.rb to be
# set into pairs and hashes. 
