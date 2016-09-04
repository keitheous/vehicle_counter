require 'pry'
require_relative 'bound'
require 'time'

class Group
  attr_reader :bound_arr

  def initialize(bound)
    @bound_arr = which_bound?(bound)
  end

  def into_pairs_by_day
    day = 0
    veh_count = 1
    bound_vehicles = {}

    bound_arr.each_with_index do |line, index|
      per_vehicle_detail = []
      # a new day has rolled in - when the line lengths drop
      day += 1 if bound_arr[index].length < bound_arr[index-1].length

      if index % 2 == 0 # process a pair at a time 0-1, 2-3, 4-5, and etc
        first_axle = convert_data_to_s(line)
        first_axle_time = Time.at(first_axle).utc
        second_axle = convert_data_to_s(bound_arr[index+1])
        prev_veh_first_axle = convert_data_to_s(bound_arr[index-2])
        axles_diff = (second_axle - first_axle).round(2)
        axles_diff_frm_prev_veh = (first_axle - prev_veh_first_axle).round(2)

        bound_vehicles[veh_count] = [day, first_axle_time, first_axle, axles_diff, axles_diff_frm_prev_veh]
        veh_count += 1
      end
    end
    bound_vehicles
  end

  private
  def which_bound?(bound)
    bound == "nb" ? Bound.new.north : Bound.new.south
  end

  def convert_data_to_s(data_ms)
    data_ms.delete('^0-9').strip.to_i / 1000.000
  end
end

# Thought Process:
# ----------------
# This class groups North OR South Bound in pairs, depending on the argument
# that is passed into execution. Private method which_bound? determines this
# with an IF ELSE statement.
#
# The array that is passed in will then be processed on line 22 for every
# (index % 2 == 0) starting from 0-1, 2-3, 4-5 and etc. Private method
# convert_data_to_s strips off the digits and divide them by 1000 to convert
# miliseconds to seconds. Line 24 then converts this seconds into the H:M:S time
# format.
#
# (day += 1 if bound_arr[index].length < bound_arr[index-1].length)
# While all of this is running, Line 20's IF statement looks out for
# any occurance of a new day where theres a drop in data.length. When this occur,
# Day will increment. Index 0 is a new day because Index -1 (which is the last
# element of the Array) has a longer length. This is then recorded in the hash.
#
# Other info such as time between two axles (Line 25), and time between current
# car's first axle and previous car's first axle (Line26) was also kept in the
# result to respectively obtain individual car speed and distance between cars.
#
# The result of this class is used in both distribution.rb and session.rb
