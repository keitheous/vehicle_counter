require 'pry'
require_relative 'sort_by_day'
require_relative 'south_bound'
require_relative 'north_bound'

class Distribution
  attr_reader :road, :avg_wheelbase_between_axles, :num_days, :traffic_speed_limit
  def initialize(bound)
    @road = which_bound?(bound)
    # puts road
    @avg_wheelbase_between_axles = 2.5 #meters
    @num_days = road[road.count][0]
    @traffic_speed_limit = 60 * 0.277 #kph to ms
  end

  def speed
    velocities_stored_per_day = []
    weekly_speed_results = {}
    velocity_sum = 0
    (1..num_days).each do |day|
      subject_per_day = road.select{ |index, data_value| data_value[0] == day }
      # puts subject_per_day
      subject_per_day.each do |key, value|
        individual_veh_velocity = (avg_wheelbase_between_axles / value[5]).round(2)
        velocity_sum += individual_veh_velocity
        velocities_stored_per_day << individual_veh_velocity
      end
      average_velocity = (velocity_sum / subject_per_day.count).round
      weekly_speed_results[day] = {"daily velocity average" => "#{average_velocity} m/s" ,"range" => "#{velocities_stored_per_day.min} m/s - #{velocities_stored_per_day.max} m/s"}
    end
    weekly_speed_results
  end

  def distance
    weekly_distance_results = {}
    periods_of_day = ["0,6","6,12","12,18","18,24"]


    (1..num_days ).each do |day|
      first_axles_arr = []
      dist_arr = []
      hour_distance_car = []

      subject_per_day = road.select{ |index, data_value| data_value[0] == day }

      subject_per_day.each do |key, value|
        dist_arr << [value[6], value[1].hour]
      end

      dist_arr.each_with_index do |line, index|
        hour_distance_car << ["Hour : #{line[1]}", "#{meters_in_between?((line[0] - dist_arr[index-1][0]))} meters" , "car number #{index+1}"]
      end
      weekly_distance_results[day] = hour_distance_car

    end
    binding.pry
  end
  private

  def which_bound?(bound)
    if bound == "nb"
      Sorting.new.into_hashes(SouthBound.new.isolate_SB_vehicles_B)
    elsif bound == "sb"
      Sorting.new.into_hashes(NorthBound.new.isolate_NB_vehicles_A)
    end
  end

  def meters_in_between?(time)
    (time * traffic_speed_limit).round(2)
  end
end

# Distribution.new("sb").speed
Distribution.new("sb").distance
