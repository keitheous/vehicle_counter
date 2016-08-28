require 'pry'
require_relative 'sort_by_day'

class Display
  def initialize(bound = "nb")
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    a = Sorting.new.into_hashes(bound)
    # binding.pry
  end

  def by_time_section(minutes = 60)
    puts minutes
  end

end

Display.new.by_time_section
