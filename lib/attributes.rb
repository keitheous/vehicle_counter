require 'pry'
require_relative 'sort'

class Attributes
  attr_reader :bound, :avg_wheelbase_between_axles, :num_days, :traffic_speed_limit
  def initialize(nb_or_sb)
    @bound = which_bound?(nb_or_sb)
    @avg_wheelbase_between_axles = 2.5 #metres
    @num_days = bound[bound.count][0]
    @traffic_speed_limit = 60 * 0.277 #convert kph to ms
  end

  def speed
    velocities_stored_per_day = []
    weekly_speed_results = {}
    velocity_sum = 0
    (1..num_days).each do |day|
      subject_per_day = bound.select{ |_, hash_data| hash_data[0] == day }
      subject_per_day.each do |_, values|
        individual_veh_velocity = avg_wheelbase_between_axles / values[3]
        velocity_sum += individual_veh_velocity
        velocities_stored_per_day << individual_veh_velocity.round(2)
      end
      average_velocity = (velocity_sum / subject_per_day.count).round(2)
      weekly_speed_results[day] = {"m/s range" => "#{velocities_stored_per_day.min} - #{velocities_stored_per_day.max}", "m/s average" => "#{average_velocity}"}
    end
    weekly_speed_results

  end

  def distance_apart (begin_hour, end_hour)
    check_hour_validity?(begin_hour, end_hour)
    weekly_distance_results = {}
    (1..num_days).each do |day|
      desired_hourly_results = []
      hourly_sum = 0
      distance_arr = []
      subject_per_day = bound.select{ |index, data_value| data_value[0] == day }
      subject_per_day.each do |_, values|
        distance_arr << [(values[4]* traffic_speed_limit).round(2) , values[1].hour]
      end
      distance_arr.each do |value|
        if value[1].between?(begin_hour,end_hour)
        desired_hourly_results << value[0]
        hourly_sum += value[0]
        end
      end
      average = (hourly_sum / desired_hourly_results.length).round(2)
      weekly_distance_results[day] = "between hour #{begin_hour}-#{end_hour} ,distance range(m): #{ desired_hourly_results.min} - #{desired_hourly_results.max} with average(m): #{average} "
    end
    weekly_distance_results
  end
  private

  def which_bound?(nb_or_sb)
    nb_or_sb == "nb" ? Sort.new("nb").into_pairs_by_day : Sort.new("sb").into_pairs_by_day
  end

  def check_hour_validity?(begin_hour, end_hour)
    raise 'error' if !begin_hour.between?(0,23) || !end_hour.between?(0,23) || end_hour < begin_hour
  end

end

# Attributes.new("sb").speed
# Attributes.new("sb").distance_apart(8,9)
