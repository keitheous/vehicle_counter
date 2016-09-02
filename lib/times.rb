require 'pry'
require_relative 'displays'

class Times
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
      weekly_data[day].each do |_, value|
        data_per_day  << value
      end
      peak_times_amount.times do
        single_peak << "Hour: #{data_per_day.index(data_per_day.max)} with #{data_per_day.max} vehicles"
        data_per_day.delete(data_per_day.max)
      end
      weekly_peaks[day] = single_peak
    end
    puts weekly_peaks
    binding.pry
  end

  def compare_morning_evening
    weekly_comparison = {}

    (1..weekly_data.size).each do |day|
      morning_veh_count = 0
      evening_veh_count = 0
      per_day_subject = weekly_data.select{|day_of_the_week, data| day_of_the_week == day}

      per_day_subject.each do |key, value|
        (6...12).each do |hour| # 12pm to 6pm
          morning_veh_count += value["#{hour}:0"]
        end
        (18..23).each do |hour| # 6pm to 12am
          evening_veh_count += value["#{hour}:0"]
        end

        weekly_comparison[key] = {"morning"=> morning_veh_count , "evening" => evening_veh_count }
      end
    end
    weekly_comparison

  end

  private
  def which_bound?(bound)
    bound == "nb" ? Displays.new("nb").sort_sections : Displays.new("sb").sort_sections
  end

  def quantity_valid_input(amount)
    raise 'error' if amount < 0
  end
end
