require 'pry'
require_relative 'sort_by_day'

class Display
  attr_reader :bound_subject

  def initialize(bound = "nb")
    if bound == "nb"
      bound = NorthBound.new.isolate_NB_vehicles_A
    elsif bound == "sb"
      bound = SorthBound.new.isolate_SB_vehicles_B
   end
    @bound_subject = Sorting.new.into_hashes(bound)
    # puts bound_subject
  end

  def by_time_section(minutes = 60)
    if 60 % minutes != 0 # display sections must be equally portioned 10, 15, 20, 30, 60
      puts "ERROR ERROR!" #learn how to raise error here
    else
      num_days = bound_subject[bound_subject.length][0] #.last night working
      # num_days = 5
      sections = 60 / minutes
      bound_stored_daily = {}

      (1..num_days).each do |day|
        stored_hourly = []
        table_by_sections = {}
        puts "Evaluating Day: #{day}"
        daily_subject_hash = bound_subject.select{|k, v| v[0] == day} #filtering - process one day at a time
        (1..23).each do |hour|
          puts "HOUR : #{hour}"

          count = 0
          daily_subject_hash.each do |key,value|

            if value[1].hour == hour
              # puts "#{value[1].hour} in key #{key}"
              count = count + 1
            end

          end
          stored_hourly << count
        end
        bound_stored_daily[day] = stored_hourly
        binding.pry
      end

    end
  end

end

Display.new.by_time_section
