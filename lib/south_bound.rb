require 'pry'
require './data_source'

class NorthBound
  attr_accessor :sb_vehicles

  def isolate_SB_vehicles_B
    sb_vehicles = []
    #initializing empty array to store ALL nb vehicles
    all_vehicle_data = Source.new.locate_data

    all_vehicle_data.each do |line| #iterate through the list

      if line[0] == "B"
        # filtering all Bs
        sb_vehicles << line
        # store in sb vehicles array
      end

    end

    sb_vehicles
  end

end

# NorthBound.new.isolate_SB_vehicles_B
