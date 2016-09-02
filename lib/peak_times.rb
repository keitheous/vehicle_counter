require 'pry'
require_relative 'displays'

class PeakTimes
  attr_reader :weekly_data, :peak_times_quant

  def initialize(bound = "nb", peak_times_amount = 3)
    quantity_valid_input(peak_times_amount)
    @weekly_data = which_bound?(bound)
    @peak_times_quant = peak_times_amount
  end

  def determine_times
    weekly_peaks = {}
    (1..weekly_data.length).each do |day|
      data_per_day = []
      single_peak = []
      weekly_data[day].each do |_, value|
        data_per_day  << value
      end
      peak_times_quant.times do
        single_peak << "Hour: #{data_per_day.index(data_per_day.max)} with #{data_per_day.max} vehicles"
        data_per_day.delete(data_per_day.max)
      end
      weekly_peaks[day] = single_peak
    end
    puts weekly_peaks
  end

  private
  def which_bound?(bound)
    bound == "nb" ? Displays.new("nb").sort_sections : Displays.new("sb").sort_sections
  end
  
  def quantity_valid_input(amount)
    raise 'error' if amount < 0
  end
end

# PeakTimes.new("sb").determine_times
