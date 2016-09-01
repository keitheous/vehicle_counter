require 'pry'
require_relative 'data_source'

class SouthBound

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

    sb_vehicles #returned result
    # binding.pry
  end

end

# 11276
# SouthBound.new.isolate_SB_vehicles_B
