require 'pry'
require_relative 'sort_by_day'

class Display
  attr_accessor :a

  def initialize(bound = "nb")
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    @a = Sorting.new.into_hashes(bound)
    # binding.pry
  end

  def by_time_section(minutes = 60)
    # puts minutes
    if 60 % minutes != 0
      puts "error" #learn how to raise error
    else
      puts @a
      binding.pry
    end
  end

end

Display.new.by_time_section
# [3] pry(#<Display>)> @a.each do |key, value|
# [3] pry(#<Display>)*   puts key or value
# [3] pry(#<Display>)* end
