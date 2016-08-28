require 'pry'
require_relative 'north_bound'

class Sorting #sort into days and axle pairs

  def into_hashes(the_array) #argument nb or sb in array form
    day = 0
    

    the_array.each_with_index do |line, index| #iterating through array

      if the_array[index].length < the_array[index-1].length
        day +=1
      end

      if index % 2 == 0 # process a pair at a time 0-1, 2-3, 4-5, and etc
        axle_one = line.delete('^0-9').strip.to_i / 1000.000
        axle_one_t = Time.at(axle_one)
        axle_two = the_array[index+1].delete('^0-9').strip.to_i / 1000.000
        axle_two_t = Time.at(axle_two)
        # 1st no. in pair represent 1st axle while 2nd no. represent 2nd axle
        puts "#{axle_one_t} - #{axle_two_t}"
      end

    end

  end
  binding.pry
end

a = NorthBound.new.isolate_NB_vehicles_A
Sorting.new.into_hashes(a)
