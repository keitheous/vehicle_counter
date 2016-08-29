require 'pry'
require_relative 'sort_by_day'

class Display
  attr_reader :a

  def initialize(bound = "nb")
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    @a = Sorting.new.into_hashes(bound)
    # binding.pry
  end

  def by_time_section(minutes = 60)
    puts num_days = a[a.length][0]
    daily_subject_hash = Hash.new
    sections = 60 / minutes
    frequency_table = {}

    (1..num_days).each do |day|
      puts "Day #{day}"
      daily_subject_hash = a.select{|key, value| value[0] == day} #filter by day

      (00..23).each do |hour|
        low_bound = 0
        high_bound = minutes - 1

        sections.times do
          (low_bound .. high_bound).each do |minute|
            frequency_arr = []
            @a.each do |key,value|
              if value[1].hour == hour && value[1].min.between?(low_bound,high_bound)
                frequency_arr << key
              end
            end
          frequency_table["#{hour}:#{low_bound}"] = frequency_arr.count
          end
        low_bound += minutes
        high_bound += minutes
        end
      end

    end

  puts frequency_table

  end

end

Display.new.by_time_section
