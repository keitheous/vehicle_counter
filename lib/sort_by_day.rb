require 'pry'
require_relative 'south_bound'
require_relative 'north_bound'
require 'time'

class Sorting #sort into days and axle pairs

  def into_hashes(the_array) #argument nb or sb in array form
    day = 0
    vehicle = 1
    per_bound_vehicles = {} #initializing all variables for class Sorting

    the_array.each_with_index do |line, index| #iterating through array

      per_vehicle_dets = [] #initialize individual temp storing details

      # a new day has rolled in - when the line lengths drop
      if the_array[index].length < the_array[index-1].length

        day +=1

      end

      if index % 2 == 0 # process a pair at a time 0-1, 2-3, 4-5, and etc

        # 1st no. in pair represent 1st axle while 2nd no. represent 2nd axle
        axle_one = line.delete('^0-9').strip.to_i / 1000.000
        axle_one_t = Time.at(axle_one).utc

        axle_two = the_array[index+1].delete('^0-9').strip.to_i / 1000.000
        axle_two_t = Time.at(axle_two).utc

        # axle_diff is the difference between the two - to determine speed
        axle_diff = (axle_two - axle_one).round(4)

        # storing all dets into temporary storage
        per_vehicle_dets << day << axle_one_t << index << axle_two_t << index+1 << axle_diff
        # puts "#{axle_one_t.hour} - #{axle_two_t.hour} - #{day} - #{axle_diff}s"

        # assign temp storage into per_bound_vehicles with key vehicle
        per_bound_vehicles[vehicle] = per_vehicle_dets

        #increment for next iteration
        vehicle += 1

      end

    end

    per_bound_vehicles #returned result
    # binding.pry
  end

end

# a = SorthBound.new.isolate_SB_vehicles_B
# a = NorthBound.new.isolate_NB_vehicles_A
# Sorting.new.into_hashes(a)
