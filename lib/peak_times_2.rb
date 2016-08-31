require 'pry'
require_relative 'display_details'

class PeakTimes
  attr_reader :week_data, :quantity

  def initialize(bound = "nb", times = 4)
    @week_data = Display.new(bound).by_time_section
    @quantity = times
  end

  def determine_times
    weekly_peak = {}

    (1..week_data.length).each do |day|
      # puts day
      daily_data = []
      single_peak = []

      week_data[day].each do |key, value|
        daily_data  << value
      end

      quantity.times do |interation|
        # binding.pry
        single_peak << ["Hour: #{daily_data.index(daily_data.max)}" , daily_data.max]
        daily_data.delete(daily_data.max)
      end

      weekly_peak[day] = single_peak

    end

    puts weekly_peak
    # binding.pry
  end
end

PeakTimes.new.determine_times
