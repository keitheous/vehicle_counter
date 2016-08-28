require 'pry'
require './data_source'

class NorthBound
  attr_accessor :nb_vehicles

  def isolate_NB_vehicles_A
    nb_vehicles = []
    #initializing empty array to store ALL nb vehicles
    all_vehicle_data = Source.new.locate_data

    all_vehicle_data.each_with_index do |line, index| #iterate through the list

      if (index % 2 == 0) #process two lines at a time starting from 0-1, 2-3, etc

        if all_vehicle_data[index][0] == all_vehicle_data[index + 1][0]
          # filtering all AA patterns NOT ABAB
          nb_vehicles << all_vehicle_data[index] << all_vehicle_data[index+1]
          # 1st A = first Axle, 2nd A = second Axle, store in sequential order
        end

      end

    end

    nb_vehicles
  end

end

NorthBound.new.isolate_NB_vehicles_A
