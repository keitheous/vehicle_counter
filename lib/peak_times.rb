require 'pry'
require_relative 'display_details'

class PeakTimes
  attr_reader :week_data

  def initialize(bound)
    @week_data = Display.new(bound).by_time_section
  end

  def determine_times
    weekly_peak = {}

    (1..week_data.length).each do |day|
      # puts day
      daily_data = []

      week_data[day].each do |key, value|
        daily_data  << value
      end

      weekly_peak[day] = { "vehicle count" => daily_data.max, "time" => daily_data.index(daily_data.max) }

    end

    puts weekly_peak
    # binding.pry
  end
end

PeakTimes.new("nb").determine_times
