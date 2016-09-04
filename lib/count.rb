require 'pry'
require_relative 'session'

class Count
  attr_reader :weekly_data

  def initialize(bound = "nb")
    @weekly_data = which_bound?(bound)
  end

  def determine_peaks(peak_times_amount = 3)
    quantity_valid_input(peak_times_amount)
    weekly_peaks = {}
    (1..weekly_data.length).each do |day|
      data_per_day = []
      single_peak = []
      weekly_data[day].each { |_, value| data_per_day  << value }
      peak_times_amount.times do
        single_peak << "Peak Hour #{data_per_day.index(data_per_day.max)} with #{data_per_day.max} vehicles"
        data_per_day.delete(data_per_day.max)
      end
      weekly_peaks[day] = single_peak
    end
    weekly_peaks
  end

  def compare_morning_evening
    weekly_comparison = {}
    (1..weekly_data.size).each do |day|
      morning_veh_count = 0
      evening_veh_count = 0

      per_day_subject = weekly_data.select{|day_of_the_week, _| day_of_the_week == day}
      per_day_subject.each do |_, value|
        # 6am to 12pm & 6pm to 12am
        (6...12).each { |hour| morning_veh_count += value["#{hour}:0"] }
        (18..23).each { |hour| evening_veh_count += value["#{hour}:0"] }
        weekly_comparison[day] = {"morning 6am-12pm"=> morning_veh_count , "evening 6pm-12am" => evening_veh_count }
      end
    end
    weekly_comparison
  end

  private
  def which_bound?(bound)
    bound == "nb" ? Session.new("nb").sort_sections : Session.new("sb").sort_sections
  end

  def quantity_valid_input(amount)
    raise 'error' if amount < 0
  end
end

# Thought Process:
# ----------------
# For the morning and evening comparison i have decided to limit morning hours
# to run between 6am to 12pm because 12am - 12pm and 6pm - 12 am isnt worth comparing.
# Also this would be about practicality. People drive to work and back home within
# these hours.

# a peak time is determined using array.max (Line 19), after obtaining this data,
# array.delete (Line 20) is used to obtain the next peak time.
