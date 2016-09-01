require 'pry'
require_relative 'data_source'

class NorthBound

  def isolate_AA
    nb_vehicles = []

    all_vehicle_data = DataSource.new.locate

    all_vehicle_data.each_with_index do |_, index|

      if index % 2 == 0 #process two lines at a time starting from 0-1, 2-3, etc

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

a = NorthBound.new
puts a.isolate_AA
