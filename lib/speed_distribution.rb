require 'pry'
require_relative 'sort_by_day'
require_relative 'south_bound'
require_relative 'north_bound'

class Speed
  attr_reader :road, :avg_wheelbase_between_axles
  def initialize(bound)
    @road = which_bound?(bound)
    # puts road
    @avg_wheelbase_between_axles = 2.5 #meters
  end

  def formulate
    # last_day = road[road.count][0]
    last_day = 1
    (1..last_day).each do |day|
      subject_per_day = road.select{ |index, data_value| data_value[0] == day }
      # puts subject_per_day
      subject_per_day.each_with_index
      binding.pry
    end
  end



  private

  def which_bound?(bound)
    if bound == "nb"
      Sorting.new.into_hashes(SouthBound.new.isolate_SB_vehicles_B)
    elsif bound == "sb"
      Sorting.new.into_hashes(NorthBound.new.isolate_NB_vehicles_A)
    end
  end

end

Speed.new("nb").formulate
