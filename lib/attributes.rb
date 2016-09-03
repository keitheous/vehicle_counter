require 'pry'
require_relative 'sort'

class Attributes
  
  TRAFFIC_SPEED_LIMIT = 60 * 0.277 #convert kph to ms
  AVG_WHEELBASE_BETWEEN_AXLES = 2.5 #metres

  attr_reader :bound, :num_days

  def initialize(nb_or_sb = "nb")
    @bound = which_bound?(nb_or_sb)
    @num_days = bound[bound.count][0]
  end

  def speed
    velocities_stored_per_day = []
    weekly_speed_results = {}
    velocity_sum = 0
    (1..num_days).each do |day|
      subject_per_day = bound.select{ |_, hash_data| hash_data[0] == day }
      subject_per_day.each do |_, values|
        individual_veh_velocity = AVG_WHEELBASE_BETWEEN_AXLES / values[3]
        velocity_sum += individual_veh_velocity
        velocities_stored_per_day << individual_veh_velocity.round(2)
      end
      average_velocity = (velocity_sum / subject_per_day.count).round(2)
      weekly_speed_results[day] = {"m/s range" => "#{velocities_stored_per_day.min} - #{velocities_stored_per_day.max}", "m/s average" => "#{average_velocity}"}
    end
    weekly_speed_results
  end

  def distance_apart(begin_hour, end_hour)
    check_hour_validity?(begin_hour, end_hour)
    distance_results = {}
    (1..num_days).each do |day|
      desired_hourly_results = []
      hourly_sum = 0
      distance_arr = []
      subject_per_day = bound.select{ |index, data_value| data_value[0] == day }
      subject_per_day.each do |_, values|
        distance_arr << [(values[4]* TRAFFIC_SPEED_LIMIT).round(2) , values[1].hour]
      end
      distance_arr.delete_at(0)
      distance_arr.each do |value|
        if value[1].between?(begin_hour,end_hour)
        desired_hourly_results << value[0]
        hourly_sum += value[0]
        end
      end
      average = (hourly_sum / desired_hourly_results.length).round(2)
      distance_results[day] = "between hour #{begin_hour}-#{end_hour} ,distance range(m): #{ desired_hourly_results.min} - #{desired_hourly_results.max} with average(m): #{average} "
    end
    distance_results
  end
  private

  def which_bound?(nb_or_sb)
    nb_or_sb == "nb" ? Sort.new("nb").into_pairs_by_day : Sort.new("sb").into_pairs_by_day
  end

  def check_hour_validity?(begin_hour, end_hour)
    raise 'error' if !begin_hour.between?(0,23) || !end_hour.between?(0,23) || end_hour < begin_hour
  end

end
