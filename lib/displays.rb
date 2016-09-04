require 'pry'
require_relative 'sort'
Displays.new(bound,"").sort_sections
class Displays
  attr_reader :bound, :num_days, :minutes, :sections

  def initialize(which_bound ="nb", minute_user_input = 60)
    valid_time_input?(minute_user_input)
    @bound = which_bound?(which_bound)
    @minutes = minute_user_input
    @sections = 60 / minute_user_input
    @num_days = bound[bound.length][0]
  end

  def sort_sections
    sectioned_daily_results = {}
    (1..num_days).each do |day|
      daily_subject_hash = bound.select{|_, daily_value| daily_value[0] == day}
      # filter by day, 1 to 5, process one day a time
      sectioned_results = {}
      (00..23).each do |hour| #filer by hour, process hourly between 0 to 24
        frequency_arr = []
        lower_limit = 0 #resets to every hour - lower sectioning
        upper_limit = minutes- 1 #upper sectioning
        by_the_hour = daily_subject_hash.select{|_, hourly_values| hourly_values[1].hour == hour}
        (01..sections).each do |section| #split into the sections, process every minutely
          by_the_hour.each { |index, values| frequency_arr << index if values[1].hour == hour && values[1].min.between?(lower_limit,upper_limit) }
          sectioned_results["#{hour}:#{lower_limit}"] = frequency_arr.count
          lower_limit += minutes
          upper_limit += minutes  #increase the limits on sections
        end
      end
      sectioned_daily_results[day] = sectioned_results
    end
    sectioned_daily_results
  end

  private
  def which_bound?(bound)
    bound == "nb" ? Sort.new("nb").into_pairs_by_day : Sort.new("sb").into_pairs_by_day
  end
  def valid_time_input?(user_input)
    raise 'error' if (60 % user_input != 0 || user_input < 0)
  end
end
